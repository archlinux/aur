# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "ffmpeg" "yt-dlp")
pkgver=0.3.1
pkgrel=0
license=("BSL-1.0")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("e22356d520d068c34b654aa6151c970fe3fe393d7cfc7ddda666024fae0e5f22")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
