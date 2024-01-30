# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=python-datastruct
pkgver=1.0.0
pkgrel=1
pkgdesc='Combination of struct and dataclasses for easy parsing of binary formats'
url='https://github.com/kuba2k2/datastruct'
arch=('any')
license=('MIT')
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
source=(https://github.com/kuba2k2/${pkgname#python-}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('887eb69b48f3dd2fec6fd8c2c3625b4877fcd3b4e4ea6c89e826bfa93b3f378d')
b2sums=('aa044bbf3d28a8b7ac90558a678184879fb1da67d909a8dc10e1d7b55f0b60197d095d5fcad1cd104c4d9fd4d6a6c45c8363c3edf6a8ca60ca68003645545290')

build() {
  cd ${pkgname#python-}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname#python-}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
