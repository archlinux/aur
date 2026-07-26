# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.1.1-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.1.1-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.1.1-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.1.1-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.1/panel-rs-riscv64-linux')

sha256sums_x86_64=('c64a6f7a3266c5cb90bd895b5d0f2f7555cc6f00cc9dfa14f5d7b8497d132693')
sha256sums_aarch64=('ed8795a0ecbe4f2ed5b126c1a885cb67914aedb5c9c1edc41e0c583dcc805458')
sha256sums_powerpc64le=('529d694c3f3d5ec22896d1cd076c0fd87f66522864d00f399d74455cf586f930')
sha256sums_riscv64=('e9126a5a41cd835b5e6868ed4ca97fc076504e7f0f296d8e3f7900a5d91ff6b2')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.1.1-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
