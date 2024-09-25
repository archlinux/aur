# Maintainer: Mattias Andrée <`base64 -d`(bWF0dGlhcy5hbmRyZWU)@protonmail.com>

pkgname=libsha1
pkgver=1.1.2
pkgrel=1
pkgdesc="SHA-1 and SHA-0 hashing library"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libsha1"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha1-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b2fbe344efe7cd0f14ad0cdbab28847ac7b4c4c86bf83583e87fc028d7a06ea8)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
