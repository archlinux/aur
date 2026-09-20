# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.2-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.2-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.2-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.2-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.2/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('53475b31d10ad819ee488d81ec69fd7220a1356d9b4f587e2e9ce4a3f12a1a11')
sha256sums_aarch64=('5581b80f31560bdff13e669e753a3d2e8dc1cf2515052c7b1f244b8d5ddd96b1')
sha256sums_powerpc64le=('6bb653fa6028d12d6431f4b00bf9f378967ae8134f53bf664e82f95741cf5763')
sha256sums_riscv64=('2b047a5f0ffc34caa8e1efef487e6610e16bd71edb6fd3bed7eab272f3dcbcee')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.2-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
