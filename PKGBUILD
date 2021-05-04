# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgdesc="Terminfo files for the foot terminal emulator"
pkgname=foot-terminfo
pkgver=1.7.2
pkgrel=3
arch=('any')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('ncurses')
source=(foot-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('0c5fa72a315b65100dfb8b7343212535e75e990b2a9500e028c6078c7915eb8a')

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
