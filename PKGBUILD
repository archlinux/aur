# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.5-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.5-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.5-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.5-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('9e719bde9b321c0b0d3fc04e6f3e749d680e77c02eb06366ef5551198d8482c8')
sha256sums_aarch64=('4131ec64960379fd9afdf952b13460719223d78e8d900675b06de3696d8fa7a7')
sha256sums_powerpc64le=('f4fc296b5dbad227040f875b6f913b8383ef4e3fef4d734423bcc92810556535')
sha256sums_riscv64=('1e84c272e9bab6b103d82a47ecee6f86adb8be078a5e2fee5680cebd1ce6f0f8')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.5-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
