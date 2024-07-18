# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=fileformat
DESCR="A tool for recognizing file formats"
makedepends=("bash" "chrpath" "findutils" "glib2" "ldc")
depends=("glib2")
pkgver=0.4.2
pkgrel=0
license=("BSL-1.0 or GPL-3+")

DC=ldc2
DC_PKG=ldc

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("9dab2d5842dd4202b41243d0b454d5f391f8392b25bc5723b9156effbfae703d")

build() {
    cd "${PROJECT}-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}
