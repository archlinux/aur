# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.0-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.0-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.0-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.0-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.0/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('58a1ed09ed40b05afdfe287831a3a055d11ddffaa20878d6db7de23366c61779')
sha256sums_aarch64=('19479b4ec73885eda91dc5d288d78cd95a1dd48184b1c44be3e3ceeb509bb1cf')
sha256sums_powerpc64le=('66cdf9568623708deb68fecb37712a6e71e3d526f12e50dedfff67e4726cfb3f')
sha256sums_riscv64=('631c2610e438756e891f7c549862f7f51d6b4a29251e88d76d94079920c3300a')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.0-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
