# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libhaiku
pkgver=1.0.1
pkgrel=1
pkgdesc="Poetic error messages"
arch=(i686 x86_64)
url="https://github.com/maandree/libhaiku"
license=('GPL3')
depends=(glibc)
makedepends=(glibc make coreutils gcc 'texinfo>=4.11')
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(40cc93f224038a2374006518d55ff106b225600e9bc7a0df27653a52d5a6e8a8)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install N=: DESTDIR="$pkgdir"
}

