# Maintainer: crl <crl18039102576@126.com>

pkgname=python-lightning
_name=${pkgname#python-}
pkgver=2.5.1
pkgrel=1
pkgdesc="The Deep Learning framework to train, deploy, and ship AI products Lightning fast."
arch=('any')
url='https://github.com/Lightning-AI/lightning'
license=('Apache-2.0')
depends=(
  python-fsspec
  python-lightning-utilities
  python-psutil
  python-pyaml
  python-torchmetrics
  python-pytorch-lightning
  python-typing_extensions
  python-packaging
  python-pytorch
  python-tqdm
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
source=("https://github.com/Lightning-AI/pytorch-lightning/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz")
sha512sums=('ede7eb51d27f1fe9b1fc426316cb71421cc44db29030eea154492dfca0f1ac99814f12deb55e329a69e2fadccf6b4db902122d64b2d915ad31eabd18416da71d')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
