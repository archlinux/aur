# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.4-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.4-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.4-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.4-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.4/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('09a2e3ff160899809bd8c931a940261a769fe0dce9ad85fe187a23a7391c4fb9')
sha256sums_aarch64=('fa2aa887367068259fcb01d53191ad3583373e17922abeeb93ec50f0e8415750')
sha256sums_powerpc64le=('4a6e776ba937ec645b5673dc089e916ebba143b63e59b7449a6634d22111f9de')
sha256sums_riscv64=('948ada3a592863c5dcf5fab3d63a42647d1fb74f2a3224adbc0832436d47364a')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.4-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
