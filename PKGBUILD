# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.4-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.4-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.4-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.4-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-riscv64-linux')

sha256sums_x86_64=('f3bd8a0b37e980c33725a546afb969717cf7a072c7136c434ca6ecf9dd09e2c8')
sha256sums_aarch64=('a91cd797eebc130176712e51f4f3f6926e11103f43b6614c1588eb76189131ae')
sha256sums_powerpc64le=('c2f775b0a79fede9b5b60c022e911373356e725c8106f1ff440a873ecefa7f1a')
sha256sums_riscv64=('f0780a8eda91147b9807d91a9414a03429bd2bd2c3e67057b656b30e72d8400a')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.4-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
