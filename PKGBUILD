# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>

pkgname=rocket-git
pkgver=r818.b7594c1
pkgrel=1
pkgdesc="Sync-tracker library and editor for realtime audiovisual productions"
arch=("i686" "x86_64" "armv7l" "aarch64")
url="https://github.com/rocket/rocket"
license=("zlib")
depends=("qt5-base")
makedepends=("git")
source=("rocket::git+https://github.com/rocket/rocket")
md5sums=("SKIP")

pkgver() {
    cd rocket
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

#prepare() {
#}

build() {
    cd rocket
    make
}

#check() {
#}

package() {
    install -d "${pkgdir}/usr/lib/rocket"
    install -d "${pkgdir}/usr/include/rocket"
    cp rocket/lib/*.a "${pkgdir}/usr/lib"
    cp rocket/lib/*.c "${pkgdir}/usr/lib/rocket"
    cp rocket/lib/*.h "${pkgdir}/usr/lib/rocket"
    cp rocket/lib/sync.h "${pkgdir}/usr/include/rocket"
    install -Dm755 rocket/editor/editor "${pkgdir}/usr/bin/rocket"
}

