# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.2.10
pkgrel=1
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.2.10-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.10/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.2.10-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.10/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.2.10-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.10/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.2.10-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.10/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('d2a4fd91e28880847a32ca89272d00c76342b200763de13b9bbbdf3f41e468e9')
sha256sums_aarch64=('586d62eec855c127b380c63684ee1581a936e0c0b98e147b5d121cb6ffc0aa02')
sha256sums_powerpc64le=('8c555a07bff3497ca8070561924c6191d55d22e288ec3d301e9ea8785d1133d3')
sha256sums_riscv64=('05ca27070738f5f78d9361b0c9783ee96013244662bfb85da155f155a94b74b8')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.2.10-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
