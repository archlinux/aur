# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=1.2.1
pkgrel=1
pkgdesc="EmulationStation Desktop Edition (ES-DE) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("https://gitlab.com/leonstyhre/emulationstation-de/-/archive/stable-1.2-AUR/emulationstation-de-stable-1.2-AUR.tar.gz")
md5sums=('cc781a99c880196242b8b64a21051571')

build() {
        cmake -B emulationstation-de-stable-1.2-AUR -S emulationstation-de-stable-1.2-AUR .
        make -C emulationstation-de-stable-1.2-AUR -j4
}

package() {
        make -C emulationstation-de-stable-1.2-AUR DESTDIR="${pkgdir}" install
}
