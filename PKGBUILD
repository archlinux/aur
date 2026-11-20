# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=fileformat
BASE_NAME=fileformat
DESCR="A tool for recognizing file formats"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2")
pkgver=0.4.7
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=ldc2
DC_PKG=ldc

pkgname=fileformat
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("08b59abbd633658381706437d336e6fd2675f9f0125d8a64daf2cf1e2eaaa7c0")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
