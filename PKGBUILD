# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.8
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.8-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.8-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.8-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.8-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.8/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('0ea57322744c7c991ddd0946f6f9608301cf4324d946c2429b80f8fca021ff8f')
sha256sums_aarch64=('4b132c3970b5454594550552dc7d1e82a69cf9b906a82c665aa749e424af035f')
sha256sums_powerpc64le=('903073c7c9a36cfa612172c8b7acb6f3beff0d827062a499bddfd518a376e366')
sha256sums_riscv64=('9e2ce37e5e7afb12be7fd707cb86add1792bdc9dd53599543cb3c94a35760e3c')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.8-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
