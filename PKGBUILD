# Maintainer: Leon Styhre <info@es-de.org>

pkgname=emulationstation-de
pkgver=3.5.0
pkgrel=1
pkgdesc="ES-DE (EmulationStation Desktop Edition) is a frontend for browsing and launching games from your multi-platform collection"
arch=('x86_64')
url="https://es-de.org"
license=('MIT')
depends=('bluez-libs' 'curl' 'ffmpeg' 'freeimage' 'freetype2' 'gettext' 'harfbuzz' 'icu' 'libgit2' 'poppler' 'pugixml' 'sdl2')
makedepends=('cmake' 'bluez-libs' 'curl' 'pkgconf' 'make' 'ffmpeg' 'freeimage' 'freetype2' 'gettext' 'harfbuzz' 'icu' 'libgit2' 'poppler' 'pugixml' 'sdl2')
source=("https://packages.es-de.org/release/${pkgver}/es-de-frontend-${pkgver}.tar.gz")
md5sums=('5e369db5235c1c4722a2e2c8230cd978')

build() {
        export CXXFLAGS=""
        cmake -DAUR_BUILD=on -B es-de-frontend -S es-de-frontend
        make -C es-de-frontend
}

package() {
        make -C es-de-frontend DESTDIR="${pkgdir}" install
}
