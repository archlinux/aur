# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: TDY <tdy@gmx.com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=xgalaga++
pkgver=0.9
pkgrel=2
pkgdesc="A classic shoot 'em up arcade game inspired by XGalaga"
arch=('i686' 'x86_64')
url="http://marc.mongenet.ch/OSS/XGalaga/"
license=('GPL')
depends=('libxpm' 'libx11')
source=(http://marc.mongenet.ch/OSS/XGalaga/${pkgname}_$pkgver.tar.gz
        $pkgname-$pkgver.diff)
md5sums=('376e7c43dc19e0f3f9a4cf1a7cb32695'
         'f97899df70b479053bcc0b9714458fdd')

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


