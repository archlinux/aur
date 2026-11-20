# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=mediafragmenter
BASE_NAME=mediafragmenter
DESCR="Tool for working with file fragments"
makedepends=("bash" "chrpath" "findutils" "xdg-utils" "glib2" "amalthea-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2")
pkgver=0.4.3
pkgrel=0
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

pkgname=mediafragmenter
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("99c7cb93ead4440d39956dd51089c0d30a7e115c2c773df54d3200db47de0f0e")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
