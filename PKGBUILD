# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=2.2.0
pkgrel=1
pkgdesc="EmulationStation Desktop Edition (ES-DE) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'libgit2' 'poppler' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'libgit2' 'poppler' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-2.2-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-2.2-AUR/emulationstation-de-stable-2.2-AUR.tar.gz")
md5sums=('c1ed127a1bf0fb2a56cad55036fee70d')

build() {
        cmake -DAUR_BUILD=on -B emulationstation-de-stable-2.2-AUR -S emulationstation-de-stable-2.2-AUR
        make -C emulationstation-de-stable-2.2-AUR -j4
}

package() {
        make -C emulationstation-de-stable-2.2-AUR DESTDIR="${pkgdir}" install
}
