# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=ltchiptool
pkgver=4.10.1
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
sha256sums=('8be1eba8d9b6edfd10ba4dee5b68429f3dc16b793c276ad6fd5c4af8bb560e16')
b2sums=('8f9f2401b2cc65de8e09f3b45e5bae7c5fea3a6aaaeb3ffeb826636a9b741f6cda93e55cc59bce0b42b66d7f0015cf579747c94f3facb3549e89b6f5b0de40ca')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
