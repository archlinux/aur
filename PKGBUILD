# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=3.0.1
pkgrel=1
pkgdesc="ES-DE (EmulationStation Desktop Edition) is a frontend for browsing and launching games from your multi-platform game collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('curl' 'ffmpeg' 'freeimage' 'freetype2' 'libgit2' 'poppler' 'pugixml' 'sdl2')
makedepends=('cmake' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'libgit2' 'poppler' 'pugixml' 'sdl2')
conflicts=('emulationstation' 'emulationstation-git')
source=("emulationstation-de-stable-3.0-AUR_${pkgver}-${pkgrel}.tar.gz::https://gitlab.com/es-de/emulationstation-de/-/archive/stable-3.0-AUR/emulationstation-de-stable-3.0-AUR.tar.gz")
md5sums=('50e0eab69da2a1c14c7d22f1cd50a2a5')

build() {
        cmake -DAUR_BUILD=on -B emulationstation-de-stable-3.0-AUR -S emulationstation-de-stable-3.0-AUR
        make -C emulationstation-de-stable-3.0-AUR -j6
}

package() {
        make -C emulationstation-de-stable-3.0-AUR DESTDIR="${pkgdir}" install
}
