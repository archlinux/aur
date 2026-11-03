# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=bbsi
BASE_NAME=bbsi
DESCR="Several scripts to facilitate some everyday tasks"
makedepends=("make")
depends=("bash" "net-tools" "ffmpeg" "python-virtualenv" "python-pip")
pkgver=0.6.0
pkgrel=0
license=("BSL-1.0")

pkgname=bbsi
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("0e0b94055efcdea3e4cf8f0eeb09679d2bcb2959b0307855def51e4059ce4351")

build() {
    cd "${PROJECT}-v${pkgver}"
    make || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install || return 1
}
