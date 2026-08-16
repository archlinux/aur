# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.1.4-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.4/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.1.4-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.4/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.1.4-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.4/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.1.4-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.4/panel-rs-riscv64-linux')

sha256sums_x86_64=('119bca5e35563ae281f14d0b25c9ff4832e0abe6c8988f5e708b6a24066fa46b')
sha256sums_aarch64=('7fcca8530cae87b352490caf184055e7dace67038f8382d3a79bfa67955d5f5c')
sha256sums_powerpc64le=('8b236c230776373a63a5fef936b72712bb07c91d2a0969d4263ebecd58bfdbe5')
sha256sums_riscv64=('fb1fa97a77a74fd42f314fa7c4b8329b264dffbbf5458ccad0aefd240acf5474')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.1.4-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
