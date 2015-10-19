# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

_pkgname=the_silver_searcher
pkgname=silver-searcher-git
pkgver=0.22.0.r1182.9303d2b
pkgrel=1
pkgdesc="The Silver Searcher: An attempt to make something better than ack, which itself is better than grep."
arch=(i686 x86_64)
url=https://github.com/ggreer/the_silver_searcher
license=(Apache)
makedepends=(git)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=(git://github.com/ggreer/$_pkgname.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname/
    echo $(git describe --tags | sed 's/-/./g').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd $_pkgname/
    ./build.sh
}

package() {
    cd $_pkgname/
    install -Dm755 ag "$pkgdir"/usr/bin/ag
    install -Dm644 doc/ag.1 "$pkgdir"/usr/share/man/man1/ag.1
}
