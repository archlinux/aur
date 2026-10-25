# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.7
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.7-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.7/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.7-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.7/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.7-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.7/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.7-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.7/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('fbf7e7f4a6e90c605f729016f6b16d44872f093db6f5a10d93cd614e1fcf9f97')
sha256sums_aarch64=('f883ade56dc62381507110560c0c40795411e4bee4e0cb7b4e4038ebfe86f8e6')
sha256sums_powerpc64le=('7b01adc5cea9f4faff98fe6a8b026d91f3b9eedbf8014c7e90dfd2f48f814674')
sha256sums_riscv64=('69ea880834101d91cfa46a8a3cf5c62b3ef0778c1418ad920bcea3b6d88c2d58')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.7-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
