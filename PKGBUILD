# Maintainer: Winston Weinert <winston@ml1.net>

pkgname=crimson
pkgver=0.5.3
pkgrel=2
epoch=
pkgdesc='Turn-based tactical war game with a hex grid and multiplayer support'
arch=('i686' 'x86_64')
url="http://crimson.seul.org"
license=('GPL')
depends=('sdl'
         'sdl_ttf'
         'sdl_mixer'
         'sdl_net')
source=("$url/files/$pkgname-$pkgver.tar.gz")
sha512sums=('56a0c8c3e271f6ca53baaee23c28b594033b2d3e4b22fb4cd58c9858dc2bda556a13d1204cdba607da0a4414affb455b1403dde73e385a1accdd5162ec9e0a89')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
