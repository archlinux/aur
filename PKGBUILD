# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=bbsi
BASE_NAME=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "ffmpeg" "net-tools" "python-virtualenv" "python-pip")
pkgver=0.5.2
pkgrel=0
license=("BSL-1.0")

pkgname=bbsi
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("40af8371f07051b68cf428ba7ba9e323bf297920ba439e7695680d8026650ce9")

build() {
    cd "${PROJECT}-v${pkgver}"
    make || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install || return 1
}
