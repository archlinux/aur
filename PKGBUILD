# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libclut
pkgver=0.3
pkgrel=1
pkgdesc="C library for manipulating colour lookup tables"
arch=(i686 x86_64)
url="https://github.com/maandree/libclut"
license=('GPL3')
depends=(glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(cfe08986c627fce3dd7e5d2954cd297d6d45fdbb7d1bb807300843a05af5f4b4)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

