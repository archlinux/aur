# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=2.0.0
pkgrel=2
pkgdesc="EmulationStation Desktop Edition (ES-DE) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-2.0-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-2.0-AUR/emulationstation-de-stable-2.0-AUR.tar.gz")
md5sums=('2b7b5a8e8c77a1a48f420dcc61958ee6')

build() {
        cmake -DAUR_BUILD=on -B emulationstation-de-stable-2.0-AUR -S emulationstation-de-stable-2.0-AUR
        make -C emulationstation-de-stable-2.0-AUR -j4
}

package() {
        make -C emulationstation-de-stable-2.0-AUR DESTDIR="${pkgdir}" install
}
