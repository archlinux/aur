# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libclut
pkgver=1.0
pkgrel=1
pkgdesc="C library for manipulating colour lookup tables"
arch=(i686 x86_64)
url="https://github.com/maandree/libclut"
license=('GPL3')
depends=(glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(824bedc72e0ffd3d5f501b5c060abfb2da9b29d2f514972a2f9c7389b691c06b)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

