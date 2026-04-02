# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "ffmpeg" "net-tools" "python-virtualenv" "python-pip")
pkgver=0.4.1
pkgrel=0
license=("BSL-1.0")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("04cca484f23cfbbe2ebe91a4a3ae32ed1f1408e17126c03519b73ac6229995ad")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir PREFIX=usr install || return 1
}
