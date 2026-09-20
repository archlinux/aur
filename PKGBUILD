# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.2-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.2-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.2-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.2-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-riscv64-linux')

sha256sums_x86_64=('731aa6cbd42d5031b557f7f8312beaccb783f4ef199b4ed87ebfa8bb70ad38db')
sha256sums_aarch64=('68d30319e496735d874cb706cee07835afe2fc8a7811230cf7f37d378ca6fd03')
sha256sums_powerpc64le=('bc39b656e9c5f294b94e31c0fa823c4c03f1036f6ad9e44d2d3b8db768195432')
sha256sums_riscv64=('9aadf6e275c3737af1265620c606797e0ff8567676b3c5cf5623f39bd310e47b')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.2-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
