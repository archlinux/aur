# Maintainer: Marcin Mielniczuk <marmistrz@inboxalias.com>

pkgname=ivan
pkgver=0.55
_vertag=055
pkgrel=1
pkgdesc="Iter Vehemens ad Necem - a tile-graphics roguelike with limb dismembering"
arch=('i686' 'x86_64')
url="https://attnam.com"
license=('GPL2')
depends=('sdl' 'sdl2_mixer')
makedepends=('git')
source=("git+https://github.com/Attnam/ivan.git#tag=v${_vertag}")
sha1sums=("SKIP")
options=(!strip)
build() {
    cd "${srcdir}/${pkgname}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="$pkgdir"
}

