# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=coopgammad
pkgver=1.3
pkgrel=1
pkgdesc="Cooperative gamma server"
arch=(i686 x86_64)
url="https://github.com/maandree/coopgammad"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fd61cb16130a87f0c07443914a3964884749e7ae360e6ac7ef2713eb5163655c)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

