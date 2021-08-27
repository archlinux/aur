# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc="Terminfo files for the foot terminal emulator"
pkgname=foot-terminfo
pkgver=1.9.0
pkgrel=1
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('ddc3f90185ae75badcb2d6abe772d54fd6defebf1ed4111861a9c4afa1c73a4d')

build() {
  cd foot
  mkdir -p build
  tic -x -o build -e foot,foot-direct foot.info
}

package() {
  cd foot
  install -dm 755 "${pkgdir}/usr/share/foot/terminfo/f/"
  cp build/f/* "${pkgdir}/usr/share/foot/terminfo/f/"
}
