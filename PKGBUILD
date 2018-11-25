# Maintainer: Petr Kutálek <petr@kutalek.cz>
pkgname=png2pos
pkgver=1.7.2
pkgdesc='A utility to converter PNG images to ESC/POS'
url='https://github.com/petrkutalek/png2pos'
license=('MIT')

pkgrel=0
epoch=
arch=('i686' 'x86_64' 'arm')
makedepends=('git')
source=(
    "$pkgname"::"git+https://github.com/petrkutalek/png2pos.git#tag=v${pkgver}"
    )
sha256sums=(
    'SKIP'
    )

prepare () {
    cd "$pkgname"
    git submodule init
    git submodule update
}

build () {
    cd "$pkgname"
    make
}

package () {
    cd "$pkgname"
    make DESTDIR="$pkgdir/usr" install
}
