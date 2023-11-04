# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=theforceengine-git
pkgver=1.10.r1.5fa4dac
pkgrel=1
pkgdesc="Modern \"Jedi Engine\" replacement supporting Dark Forces, Outlaws and the mods"
arch=('x86_64')
url="https://theforceengine.github.io/"
license=('GPL2')
depends=("libgl" "sdl2" "devil" "glew" "rtaudio" "rtmidi" "hicolor-icon-theme" "sdl2_image" )
makedepends=("cmake" "ninja" "git")
conflicts=("theforceengine")
optdepends=()
install="theforceengine.install"
source=("TheForceEngine::git+https://github.com/luciusDXL/TheForceEngine.git"
        "theforceengine.install")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd TheForceEngine
  mkdir build
  cd build
  cmake -S .. \
    -G Ninja\
    -DCMAKE_INSTALL_PREFIX=/usr\
    -DCMAKE_BUILD_TYPE=Release
  ninja
}

package() {
  cd TheForceEngine/build
  DESTDIR="$pkgdir" ninja install
}

