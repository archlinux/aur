# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=ltchiptool
pkgver=4.11.2
pkgrel=1
pkgdesc='Universal, easy-to-use GUI flashing/dumping tool for BK7231, RTL8710B and RTL8720C.'
url='https://github.com/libretiny-eu/ltchiptool'
arch=('any')
license=('MIT')
depends=(
  python
  python-datastruct
  python-click
  python-colorama
  python-importlib-metadata
  python-prettytable
  bk7231tools
  python-xmodem
  python-semantic-version
  python-hexdump
  python-bitstruct
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
optdepends=(
  python-wxpython
  python-zeroconf
)
source=(https://github.com/libretiny-eu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('70a0555ab05be709644c98aa989da51a1dc99016d9cd60db1e35aa15000a6126')
b2sums=('b31f43640d3896f44eef1850ff194eb61c51d6c3eac7c5844c2cd701b07a9e58cb9c3a608a9b0a04d0f14c6085d85fdae8b3ca79474e3b11502941b48f57aecf')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
