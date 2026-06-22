# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.0.11
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-x86_64::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-aarch64::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-riscv64::https://github.com/calagopus/panel/releases/download/release-1.0.11/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('70259b3d0023eeeff50038e41eda439caa09b7b40926fa0f64d8538cdd031336')
sha256sums_aarch64=('9c4e6e9b35ace334dea8c89b5c7c71f42123da943f4dcf9757011da7d6f1606b')
sha256sums_powerpc64le=('2c7c2207fbae6d2ca938fc51c1309266abf057da4047e7d18654afa673a286ea')
sha256sums_riscv64=('e58b8594509f0a4763e83819143655efe07af397955927815fc570165add5459')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
