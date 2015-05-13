# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TDY <tdy@gmx.com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=xgalaga++
pkgver=0.8.4
pkgrel=1
pkgdesc="A classic shoot 'em up arcade game inspired by XGalaga"
arch=('i686' 'x86_64')
url="http://marc.mongenet.ch/OSS/XGalaga/"
license=('GPL')
depends=('libxpm')
source=(http://marc.mongenet.ch/OSS/XGalaga/${pkgname}_$pkgver.tar.gz
        $pkgname-$pkgver.diff)
md5sums=('0d1b8caa29148bc5da5683158681b155'
         '7a1bd14651fd4aa80ee465f3430ad94f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i ../$pkgname-$pkgver.diff
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}


