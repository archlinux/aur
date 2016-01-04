# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libhaiku
pkgver=1.0
pkgrel=1
pkgdesc="Poetic error messages"
arch=(i686 x86_64)
url="https://github.com/maandree/libhaiku"
license=('GPL3')
depends=(glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(2d4b2f5fc669e3f100b917f84c00340a81cc5e6b2ccac3ce69cad51ed6871bc5)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

