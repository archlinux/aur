# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=vmm
DESCR="A wrapper tool for quick operations with QEMU/KVM based VMs"
makedepends=("make")
depends=("bash" "qemu-base")
pkgver=0.1.0
pkgrel=0
license=("BSL-1.0")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("7c3f6a2384563c47d450f0f3dc98d35515f8825bfe9769fb6c37a075e24b38ac")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
