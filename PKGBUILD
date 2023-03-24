# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=timm
pkgname=python-timm
pkgver=0.6.13
pkgrel=1
pkgdesc='PyTorch Image Models'
arch=('any')
url='https://pypi.org/project/timm/'
license=('Apache')
depends=(
  python-pytorch
  python-torchvision
  python-yaml
)
makedepends=(
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha512sums=('115f6bef49fe2b5a33873942242b902bb811e2f58f95e741da316e2ce20926f8ae421561a71d4c4a54b4512cbf4d6bd8c7c74d1e14e30bc31111da1266674e7d')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
