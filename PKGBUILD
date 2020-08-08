# Maintainer: Esteban López <gnu_stallman (a) protonmail (.) ch>

pkgname=snake-curses
pkgver=0.1.4
pkgrel=1
pkgdesc="Snake game written in C with Ncurses"
arch=('any')
url="https://gitlab.com/libre_hackerman/snake_curses"
license=('GPL-3')
depends=('ncurses')

source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/libre_hackerman/snake_curses/-/archive/v${pkgver}/snake_curses-v${pkgver}.tar.gz")
sha512sums=('be1f9e8cd29c4930a527c9e0d90e5b4fe1f785d4ae3b379811766f9618157effdede8ea4b68248001a42146f08bc981ebb97f202203ad8bd0d11d3000fc3b169')

build() {
  cd snake_curses-v$pkgver
  make
}

package() {
  cd snake_curses-v$pkgver
  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr" install
}
