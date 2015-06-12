# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=median
pkgver=1.1
pkgrel=1
pkgdesc="Calculate the median values for a set of groups"
arch=(any)
url="https://github.com/maandree/median"
license=(GPL3)
depends=(python3)
makedepends=(make coreutils texinfo)
install=$pkgname.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f0dccd9ef39ee5885bd81f9b0f31a8bb7ff84e8939267aae6118361c33db09e6)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}

