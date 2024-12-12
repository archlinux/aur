# Maintainer: alufers <alufers[at]wp[dot]pl>

pkgname=ltchiptool
pkgver=4.11.4
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
sha256sums=('4689bbf91f0033c4c16fbfa19d69de544224639297a002de6f9f14636a0226db')
b2sums=('e43be0f095f5cea436eac1e74ef10afbb1486ce550f8f65f31fd0832c791e19915a23542557a2253af2ff0d6a07fc67c1bc7fc98aa8b3ddad70e25df3be172ab')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
