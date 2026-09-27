# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.3
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.3-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.3/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.3-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.3/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.3-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.3/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.3-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.3/panel-rs-riscv64-linux')

sha256sums_x86_64=('598d6d234f1bda07cc7780a9eb7ba3f0202180373b352d0e5642e6f8169dc282')
sha256sums_aarch64=('c0e7f744d9fe9c7def93cfdbaf86170cf62f30c6e37d83cb24ada2a48db3042e')
sha256sums_powerpc64le=('d73381405dd64e36b4d2a27d6da9c86a918cea601d5c28d0153be277d81af294')
sha256sums_riscv64=('363849687893567d528e4a9c37ca911ff2cc598341951b5f6bce938801d7b21c')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.3-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
