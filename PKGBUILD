# Maintainer: Esteban López <gnu_stallman (a) protonmail (.) ch>

pkgname=snake-curses
pkgver=0.1.2
pkgrel=1
pkgdesc="Snake game written in C with Ncurses"
arch=('any')
url="https://gitlab.com/libre_hackerman/snake_curses"
license=('GPL-3')
depends=('ncurses')

source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/libre_hackerman/snake_curses/-/archive/v${pkgver}/snake_curses-v${pkgver}.tar.gz")
sha512sums=('b59ec674e75b900373adb4c93d7a3c485857a8d63a602011757c3b01280cb56b18acabb5d80842e53582ee3116a813e4e4efeda8aafca97a4359d83c2f06d386')

build() {
  cd snake_curses-v$pkgver
  make
}

package() {
  cd snake_curses-v$pkgver
  mkdir -p "${pkgdir}/usr/bin"
  make PREFIX="${pkgdir}/usr" install
}
