# Maintainer: Winston Weinert <winston@ml1.net>

pkgname=crimson
pkgver=0.5.3
pkgrel=1
epoch=
pkgdesc='Crimson Fields is a turn-based tactical war game. It can be played against a human opponent in hot-seat mode in front of the same machine, over a network, or via e-mail, or against the computer.'
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
