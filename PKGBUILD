# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=bbsi
BASE_NAME=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "ffmpeg" "net-tools" "python-virtualenv" "python-pip")
pkgver=0.5.0
pkgrel=0
license=("BSL-1.0")

pkgname=bbsi
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("5d138465fe3fb198f737775120d6caf824415b67d454882a5716115ed02e4236")

build() {
    cd "${PROJECT}-v${pkgver}"
    make || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install || return 1
}
