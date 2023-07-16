# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=2.1.1
pkgrel=1
pkgdesc="EmulationStation Desktop Edition (ES-DE) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'libgit2' 'poppler' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'libgit2' 'poppler' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-2.1-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-2.1-AUR/emulationstation-de-stable-2.1-AUR.tar.gz")
md5sums=('d7864509bd248d37191c1e6e58b1e4e8')

build() {
        cmake -DAUR_BUILD=on -B emulationstation-de-stable-2.1-AUR -S emulationstation-de-stable-2.1-AUR
        make -C emulationstation-de-stable-2.1-AUR -j4
}

package() {
        make -C emulationstation-de-stable-2.1-AUR DESTDIR="${pkgdir}" install
}
