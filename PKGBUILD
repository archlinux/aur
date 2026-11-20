# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=pageguard
BASE_NAME=pageguard
DESCR="A tool for saving HTML-pages with all resources embedded"
makedepends=("bash" "chrpath" "findutils" "glib2" "amalthea-ldc2" "htmldnext-ldc2" "ldc")
depends=("glib2" "amalthea-ldc2" "htmldnext-ldc2")
pkgver=0.2.1
pkgrel=0
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

pkgname=pageguard
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("a2dce9653010b9822c675b121dd66e823cadfca74aa93af3a76d937584d2bb1b")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
