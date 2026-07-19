# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-aio-bin
pkgver=1.1.0
pkgrel=2
pkgdesc='Panel, all-in-one variant with bundled dependencies'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-bin')

source_x86_64=('panel-rs-aio-1.1.0-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-aio-x86_64-linux')
source_aarch64=('panel-rs-aio-1.1.0-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-aio-aarch64-linux')
source_powerpc64le=('panel-rs-aio-1.1.0-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-aio-ppc64le-linux')
source_riscv64=('panel-rs-aio-1.1.0-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.0/panel-rs-aio-riscv64-linux')

sha256sums_x86_64=('df392eb00240a5d76294b74de9ed76e97efdef3b8a4566c683c6a4aadcae80fa')
sha256sums_aarch64=('6706251dd4218cb077ddb5ca436a127a4c8408d2040c166691d5b6d409ebd54f')
sha256sums_powerpc64le=('c9fff93a8c066436cc81cff5b53a82bbbd632582c6588dda98389eab9f881993')
sha256sums_riscv64=('63b843436101980578ea4d3659da0d0ce36f7eb31fedfb9509b8fd2e89074356')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-aio-1.1.0-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
