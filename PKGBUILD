# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.0.11
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-x86_64::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-aarch64::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-riscv64::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-riscv64-linux')

sha256sums_x86_64=('c491e74c5f02e070fb411f199bde29c07800eb3ccc6a24e5ef432603ca49ee6d')
sha256sums_aarch64=('0fcb14f8b7ae1ae7fdd0b5231d7297fbb73ce9f7bafc5854f8a85a771b3c984b')
sha256sums_powerpc64le=('8cb6dde3f5dbd16d4a0fb02c6d7fd2998365d49d4fd25e9ae336b367641f31d4')
sha256sums_riscv64=('a8c1e9d1bc001758910dc7b40a8f1791112743b34ad092ab4a05a286a580d3c5')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
