# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=bbsi
BASE_NAME=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "ffmpeg" "net-tools" "python-virtualenv" "python-pip")
pkgver=0.5.1
pkgrel=0
license=("BSL-1.0")

pkgname=bbsi
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("1de22710eed87f90de32860a0ebc909e3ecff38a4259ddc26236af9a8c75ec5e")

build() {
    cd "${PROJECT}-v${pkgver}"
    make || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install || return 1
}
