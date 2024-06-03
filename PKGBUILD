# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=ltchiptool
pkgver=4.11.1
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
sha256sums=('6ab6c6008f299574f7636a20dadd7550d01bdfa47aed8e25933cddfffb1b645e')
b2sums=('ff8ec1a1d96210ab77ecb3b7565441b7353075cc67a183cdf756ec15cb413578359b58bfbb2a87ce8d1d7f33500af82ffd6d5ebb49133a82d77a12329c606a31')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
