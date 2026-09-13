# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.1-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.1/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.1-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.1/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.1-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.1/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.1-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.1/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('d30f8298cd45503e696522bfb99bce967f04ca8301a3d068aa8bd5dda44d1620')
sha256sums_aarch64=('dc69284538a94cbead6df32faa710acb2d57c8272e720269d07dc142f37d1d3b')
sha256sums_powerpc64le=('78432aa1f71afdf4de40ca4af873839f1f9485179fcdff9900abeb2608138f90')
sha256sums_riscv64=('c64a31dd6d2a9977a7e5e595d43900b17127fd18e426f4a8f9051a1bbdc51112')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.1-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
