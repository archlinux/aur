# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.1.3
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.1.3-x86_64::https://github.com/calagopus/panel/releases/download/release-1.1.3/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.1.3-aarch64::https://github.com/calagopus/panel/releases/download/release-1.1.3/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.1.3-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.1.3/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.1.3-riscv64::https://github.com/calagopus/panel/releases/download/release-1.1.3/panel-rs-riscv64-linux')

sha256sums_x86_64=('1f39b1a633e192e43c57ae40f3abff2f963f10e825b970af1e290544c8ec4e0d')
sha256sums_aarch64=('7198df6d139c8d388365c2751032d030744f9d36fd3d02e79b43872ed18fa165')
sha256sums_powerpc64le=('25a6e3f573c46058b65a7afc3a20050dcd19789b45b09966726a7d4d7beb0689')
sha256sums_riscv64=('2e4a73da1f7a760be61fe2eedcd6b0fc435bfdc3678d91fdbae31b9ed4308771')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.1.3-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
