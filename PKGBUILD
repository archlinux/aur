# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=socket-relay
pkgver=1.1.1
pkgrel=1
pkgdesc="A framework application for host multiplexion"
arch=(any)
url="https://github.com/maandree/socket-relay"
license=('GPL3')
install=socket-relay.install
depends=(python3)
makedepends=(texinfo)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c4268fc733440d679658cf3e8d37d7036bfaee6668bd6a109cddbac115498678)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

