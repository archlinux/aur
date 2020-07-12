# Maintainer: Esteban López <gnu_stallman (a) protonmail (.) ch>

pkgname=snake-curses
pkgver=0.1.3
pkgrel=1
pkgdesc="Snake game written in C with Ncurses"
arch=('any')
url="https://gitlab.com/libre_hackerman/snake_curses"
license=('GPL-3')
depends=('ncurses')

source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/libre_hackerman/snake_curses/-/archive/v${pkgver}/snake_curses-v${pkgver}.tar.gz")
sha512sums=('eaa51367c826fdfcb84c0cc8521609e1f063daca2df15000fa412ab590ed9d11c54538946a1ea68ff71fe1221ca251e4c545523d7eff5d6c5df83538e652a036')

build() {
  cd snake_curses-v$pkgver
  make
}

package() {
  cd snake_curses-v$pkgver
  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr" install
}
