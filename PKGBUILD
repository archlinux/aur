# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.8
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.8-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.8-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.8-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.8-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-riscv64-linux')

sha256sums_x86_64=('d02b28d1dcfe5d8f33f6c4e53c25eb8e9ff32d666dc05944c424593e7ef5d88a')
sha256sums_aarch64=('648127577c0f2fcd9d84f4b6a4519a0eeacea42b03789b31077e031515129db2')
sha256sums_powerpc64le=('26aabf56c6b25d7377350501653ea19143686ad5493499213146c7fe73629180')
sha256sums_riscv64=('f6970846a0f88947b9aff3da092442eaa4a74edd63d2dd27f441a998fc5efe4a')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.8-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
