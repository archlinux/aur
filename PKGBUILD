# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libclut
pkgver=0.1
pkgrel=1
pkgdesc="C library for manipulating colour lookup tables"
arch=(i686 x86_64)
url="https://github.com/maandree/libclut"
license=('GPL3')
depends=(glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(c8658b52272f6225ce842bfc880929be1728d0f83b003d5650108167942e8d4c)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

