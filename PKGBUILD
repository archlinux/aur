# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libcolour
pkgver=1.0
pkgrel=1
pkgdesc="A C colour space library"
arch=(i686 x86_64)
url="https://github.com/maandree/libcolour"
license=('GPL3')
depends=(glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(ee309bd965eeb3f44d2b67026af4b42b283bb9a991ea9ba617dded48ff7d8b46)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

