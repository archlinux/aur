# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=fileformat
BASE_NAME=fileformat
DESCR="A tool for recognizing file formats"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-gdc" "gcc-d")
depends=("glib2" "amalthea-gdc")
pkgver=0.4.6
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=gdc
DC_PKG=gcc-d

pkgname=fileformat
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("fb259297e16459a55b7785211979bc79c5eb76361ff48c600e3e5cfce59b1e69")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
