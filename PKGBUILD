# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.11
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.11-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.11-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.11-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.11-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-riscv64-linux')

sha256sums_x86_64=('96395a49087f0c31d430c029ddf4b2a16e62f1462142258d2c01ef9b18d64174')
sha256sums_aarch64=('dcdf40783472167f8ada8298bc5a7d33a723f184ebad1e6f1afd6fc31eeef663')
sha256sums_powerpc64le=('b62d21136e0d8ab937c30257e0639650d255ced48418eeede335ad0048ae5f26')
sha256sums_riscv64=('6b768b79bb9e6c9fad37661008b752719cddb01530a58025cac6b06daae7aa9a')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.11-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
