# Maintainer: crl <crl18039102576@126.com>

pkgname=python-lightning
_name=${pkgname#python-}
pkgver=2.5.2
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
sha512sums=('c4fd87c8f8a8ee59f25b256da7f8715bf9dc356c23ae92b3bda457f3d9c3e7f9ee6af49c18143961fdbe20fbe6839d43abc838d427d5665be5af9a4894819a05')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
