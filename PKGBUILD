# Maintainer: Petr Kutálek <petr@kutalek.cz>

pkgname=png2pos
pkgver=v1.7.2
pkgrel=1

pkgdesc='A utility to converter PNG images to ESC/POS'
url='https://github.com/petrkutalek/png2pos'
arch=('x86_64')
license=('MIT')

makedepends=('git')

source=('git+https://github.com/petrkutalek/png2pos.git')
sha256sums=('SKIP')

pkgver () {
    cd png2pos
    printf '%s' "$(git tag -l -n1 | cut -f1 -d' ')"
}

prepare () {
    cd png2pos
    git submodule init
    git submodule update
}

build () {
    cd png2pos
    make
}

package () {
    cd png2pos
    make DESTDIR="$pkgdir/usr" install
}
