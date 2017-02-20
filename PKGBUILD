# Maintainer: Marcin Mielniczuk <marmistrz@inboxalias.com>

pkgname=ivan
pkgver=0.50.8
_vertag=0508
pkgrel=1
pkgdesc="Iter Vehemens ad Necem - a tile-graphics roguelike with limb dismembering"
arch=('i686' 'x86_64')
url="https://attnam.com"
license=('GPL2')
depends=('sdl')
makedepends=('git')
source=("git+https://github.com/Attnam/ivan.git#tag=v${_vertag}")
sha1sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}"
    cmake .
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir/" install
}

