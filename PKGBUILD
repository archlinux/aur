# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>
PROJECT=qmm
DESCR="A wrapper tool for quick operations with QEMU/KVM based VMs"
makedepends=("make")
depends=("bash" "qemu-base")
pkgver=0.2.5
pkgrel=0
license=("BSL-1.0")

pkgname=${PROJECT}
pkgdesc="${DESCR}"
arch=("any")
url="https://gitlab.com/os-18/${PROJECT}"
TARBALL=$pkgname-$pkgver.tar.gz
source=("$TARBALL::$url/-/archive/v$pkgver/${PROJECT}-v$pkgver.tar.gz")
sha256sums=("8e618e3b927bf351e0fb4ba1d1772621e8eafe10ed20cf567c1e3af8f343b3be")

build() {
    cd "${PROJECT}-v$pkgver"
    make || return 1
}

package() {
    cd "${PROJECT}-v$pkgver"
    make DESTDIR=$pkgdir install || return 1
}
