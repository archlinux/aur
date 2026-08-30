# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.1.5-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.1.5-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.1.5-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.1.5-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.5/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('42d9b8fe6fdcef8437bcf120768ad7a624896f2afc55e28958146a87fda55ffa')
sha256sums_aarch64=('9209246ae3d5584717b8401f821fc59d93c1856aff44b2c24565fd6649dc3cd0')
sha256sums_powerpc64le=('6504286e1876b6a3d1fd8d40f7bf93c6bbe3ff6c31c1bd87caa8069f83ded7bc')
sha256sums_riscv64=('7e7ff5fd40dc6e499e6ceecfb1c3e08c2c5fb6c69b8e4d57381d2c6c0e958e04')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.1.5-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
