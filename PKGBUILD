# Maintainer: malet
pkgname=orjail
_pkgname=orjail
pkgver=1.1
pkgrel=1
pkgdesc="a more secure way to force programs to exclusively use tor network"
arch=('x86_64')
url="https://orjail.github.io"
license=('WTFPL')
provides=('orjail')
depends=('tor')
source=(${pkgname}-${pkgver}.tar.gz::http://github.com/orjail/orjail/archive/v${pkgver}.tar.gz)
sha256sums=('85d4ae032a64d37b183f53d6d3d267b7c241f579f188d3107d6c9b160fab4e39')

build() {
  cd ${_pkgname}-${pkgver}
  make
}
package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
}
