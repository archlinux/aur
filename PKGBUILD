# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=3.1.1
pkgrel=3
pkgdesc="ES-DE (EmulationStation Desktop Edition) is a frontend for browsing and launching games from your multi-platform collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'gettext' 'harfbuzz' 'icu' 'libgit2' 'poppler' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'gettext' 'harfbuzz' 'icu' 'libgit2' 'poppler' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-3.1-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-3.1-AUR/emulationstation-de-stable-3.1-AUR.tar.gz")
md5sums=('a13433450984721335c0db7186334896')

build() {
        export CXXFLAGS=""
        cmake -DAUR_BUILD=on -B emulationstation-de-stable-3.1-AUR -S emulationstation-de-stable-3.1-AUR
        make -C emulationstation-de-stable-3.1-AUR -j6
}

package() {
        make -C emulationstation-de-stable-3.1-AUR DESTDIR="${pkgdir}" install
}
