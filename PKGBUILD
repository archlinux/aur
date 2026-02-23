# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libcontacts
pkgver=1.0.2
pkgrel=1
pkgdesc="A library for handling a simple, flexible contact list"
arch=(x86_64)
url="https://codeberg.org/maandree/libcontacts"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8ef10a499181fd72fce726a3011fb8ea7cfca2816f0084299e0c30dcf6cdd5ca)

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
