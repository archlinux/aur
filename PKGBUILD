# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.11
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.11-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.11-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.11-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.11-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.11/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('ca4457c429d661fe20c3dd5037e1d7d73f5c15bb78c90210f6e5cf84455378af')
sha256sums_aarch64=('7f8f9b7d57e48721c97eca18963f349deffcd9f80d3f8a066e058d9fa042dde1')
sha256sums_powerpc64le=('bc449db40cd85e5cd34c5b1dd9d16cbd896ebecc0a7ad5ce9072512bd9b97eab')
sha256sums_riscv64=('5edf096df541d6549ebff2fd7702bedcf771c6f23f4bb06ec588963ae3a426ef')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.11-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
