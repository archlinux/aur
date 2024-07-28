# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=qmm
DESCR="A wrapper tool for quick operations with QEMU/KVM based VMs"
makedepends=("make")
depends=("bash" "qemu-base")
pkgver=0.2.1
pkgrel=0
license=("BSL-1.0")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("e8cd76a238fe73f4527fe9f3633195b506360765c1bcbcb65cb575a73ba45a4f")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
