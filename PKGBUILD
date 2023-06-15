# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

PROJECT=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "ffmpeg" "yt-dlp")
pkgver=0.2.0
pkgrel=0
license=("Boost")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("f47030c22e37cdd1ee4a990c94bbed00f270e3c524c2aa895ecfe6deda7052d5")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install || return 1
}
