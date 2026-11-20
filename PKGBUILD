# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=link-editor
BASE_NAME=link-editor
DESCR="Editor of symbolic links"
makedepends=("bash" "ldc")
depends=("")
pkgver=0.8.1
pkgrel=0
license=("BSL-1.0")

DC=ldc2
DC_PKG=ldc

pkgname=link-editor
pkgdesc="${DESCR}"
arch=("x86_64")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=${BASE_NAME}-${pkgver}.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v${pkgver}.tar.gz")
sha256sums=("a2c60ee33c1edd01a4a8246b84bd6f8dfbcde235c74bdb13788b6a073f9125fb")

build() {
    cd "${PROJECT}-v${pkgver}"
    make DC=${DC} || return 1
}

package() {
    cd "${PROJECT}-v${pkgver}"
    make DESTDIR=$pkgdir PREFIX=usr install DC=${DC} || return 1
}
