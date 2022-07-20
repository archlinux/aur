# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=exec-as
pkgver=1.2.1.1
pkgrel=1
pkgdesc="A command that lets you start another command with any argv[0]"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/exec-as"
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(7f216d13435ec37e984a8afc0494a3186c5543bf02e3cdbf6d28201528505b69)

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
