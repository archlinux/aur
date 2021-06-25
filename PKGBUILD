# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc="Terminfo files for the foot terminal emulator"
pkgname=foot-terminfo
pkgver=1.8.0
pkgrel=1
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('9269acfbef40cb284590de3bf70fc67997ffb6361dec4b4dddae7cdbf4ad6490')

build() {
  cd foot
  mkdir -p build
  tic -x -o build -e foot,foot-direct foot.info
}

package() {
  cd foot
  install -dm 755 "${pkgdir}/usr/share/terminfo/f/"
  cp build/f/* "${pkgdir}/usr/share/terminfo/f/"
}
