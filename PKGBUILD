# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=key2root
pkgver=1.0.1
pkgrel=1
pkgdesc="Authenticate with keyfile and run a process as root"
arch=('x86_64')
url="https://codeberg.org/maandree/key2root"
license=('custom:ISC')
depends=('libar2simplified>=1.1.2' libar2 libblake)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c67cd9e9396424b0774412d7620b743a8ecc0ba7c467babf8d7c9dea5150b0a4)

build() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
