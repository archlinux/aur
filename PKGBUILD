# Maintainer: Matthias Fulz <mfulz at olznet dot de>
pkgname=archbuilder
pkgver=0.9.0
pkgrel=1
pkgdesc='makepkg wrapper that uses buildah'
url='https://gitea.olznet.de/mfulz/archbuilder'
arch=('any')
source=(
        "https://gitea.olznet.de/mfulz/$pkgname/archive/v$pkgver.tar.gz"
       )
sha256sums=('ce60d3f40cb4e73d7143bb85429f3660dc925462453ae14de7a3dacdcab55145')
depends=('buildah')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
