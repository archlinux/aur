# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=pdeath
pkgver=1.1.3
pkgrel=1
pkgdesc="Run a command that is killed when its parent exits"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/pdeath"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b79d068ead0261d211f1a009cad617182d0755319675b0f82bdb9c32558f0772)

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
