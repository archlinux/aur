# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.1.5-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.1.5-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.1.5-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.1.5-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-riscv64-linux')

sha256sums_x86_64=('fcf9cc760437695e3b9282a32e7cf80f075539c25c5f17a2232365cafa46d9f3')
sha256sums_aarch64=('bc0a7e122f113c61d4a0e148cff4e5be6113c49246e69fcd40b61f7862782954')
sha256sums_powerpc64le=('eec0949910b4a293b99caf7ad2cba9403a8737e71030e222f6e1e65503821272')
sha256sums_riscv64=('3f55d55b0a17b69335b728342ab21e82ef9dc2775a96e2f08a4dc565a0e20cad')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.1.5-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
