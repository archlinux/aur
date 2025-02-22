# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=qmm
DESCR="A wrapper tool for quick operations with QEMU/KVM based VMs"
makedepends=("make")
depends=("bash" "qemu-base")
pkgver=0.2.4
pkgrel=0
license=("BSL-1.0")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("bd3064d0416122877f2acc4f4942e135ecf1fd0ae79c7c52510128968be38966")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
