# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Marcin Mielniczuk <marmistrz@inboxalias.com>

pkgname=ivan
pkgver=0.59
_vertag=059
pkgrel=1
pkgdesc="Iter Vehemens ad Necem - a tile-graphics roguelike with limb dismembering"
arch=('i686' 'x86_64')
url="https://attnam.com"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'alsa-lib' 'libpng')
makedepends=('cmake')
source=("https://github.com/Attnam/ivan/archive/refs/tags/v${_vertag}.tar.gz")
sha1sums=('899d832120a6d5178c0d213b95bb5638158f5ea9')
options=(!strip)
build() {
    cd "${srcdir}/${pkgname}-${_vertag}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${srcdir}/${pkgname}-${_vertag}"
    make install DESTDIR="$pkgdir"
}
