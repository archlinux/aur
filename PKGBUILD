# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=3.3.0
pkgrel=1
pkgdesc="ES-DE (EmulationStation Desktop Edition) is a frontend for browsing and launching games from your multi-platform collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('bluez-libs' 'curl' 'ffmpeg' 'freeimage' 'freetype2' 'gettext' 'harfbuzz' 'icu' 'libgit2' 'poppler' 'pugixml' 'sdl2')
makedepends=('cmake' 'bluez-libs' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'gettext' 'harfbuzz' 'icu' 'libgit2' 'poppler' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-3.3-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-3.3-AUR/emulationstation-de-stable-3.3-AUR.tar.gz")
md5sums=('c551ecbfe9e5bb1f4c2dcdacafeb7e3f')

build() {
        export CXXFLAGS=""
        cmake -DAUR_BUILD=on -B emulationstation-de-stable-3.3-AUR -S emulationstation-de-stable-3.3-AUR
        make -C emulationstation-de-stable-3.3-AUR -j6
}

package() {
        make -C emulationstation-de-stable-3.3-AUR DESTDIR="${pkgdir}" install
}
