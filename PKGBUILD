# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=socket-relay
pkgver=1.2
pkgrel=1
pkgdesc="A framework application for host multiplexion"
arch=(any)
url="https://github.com/maandree/socket-relay"
license=('GPL3')
install=socket-relay.install
depends=(python3)
makedepends=(texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(492ba989528e7e3d2a025e784860b9c9c2c4b6981ddb9c7df620af0861ea9462)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

