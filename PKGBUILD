# Maintainer: Zero <zero@cock.li>

pkgname=sdl2-gamepad-mapper
pkgver=0.0.3
pkgrel=2
pkgdesc="Generate SDL2 Controller mapping strings"
arch=('any')
url='https://gitlab.com/ryochan7/sdl2-gamepad-mapper'
depends=('sdl2' 'qt5-base')
makedepends=('git')
source=('git+https://gitlab.com/ryochan7/sdl2-gamepad-mapper#commit=e3f9ea51a1a1d7fbd2b05c52e6b2e262ebe3f4fe')
sha256sums=("SKIP")

build() {
  cd "$srcdir/sdl2-gamepad-mapper"
  qmake
  make
}

package() {
  cd "sdl2-gamepad-mapper"
  install -Dm755 sdl2-gamepad-mapper "${pkgdir}/usr/bin/sdl2-gamepad-mapper"
  install -D sdl2-gamepad-mapper.desktop "${pkgdir}/usr/share/applications/sdl2-gamepad-mapper.desktop"
  install -D sdl2-gamepad-mapper.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/sdl2-gamepad-mapper.png"
}
