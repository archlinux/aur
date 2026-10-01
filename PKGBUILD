# Maintainer: crl <crl18039102576@126.com>

pkgname=python-lightning
_name=${pkgname#python-}
pkgver=2.6.6
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
sha512sums=('939f4c4888de88b97094292b7b5a522fbaacd5b92a08502980b108b011b3effacea072cf960058acac17639e1a38c297fd211a1d52951d2e681c346658472de0')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
