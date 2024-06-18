# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=fileformat
DESCR="A tool for recognizing file formats."
makedepends=("bash" "chrpath" "findutils" "glib2")
depends=("glib2")
pkgver=0.4.1
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=
DC_PKG=

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("c6a3dcaca2d20385e560a7ad7764818043be33129ba946359b593d58a2d9521b")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
