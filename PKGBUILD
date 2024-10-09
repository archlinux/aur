# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=exec-as
pkgver=1.2.2
pkgrel=1
pkgdesc="A command that lets you start another command with any argv[0]"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/exec-as"
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(5371437630fff6c86ccea081b2d26107748cfeebceb67c8b0be5276e3887abfb)

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
