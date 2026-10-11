# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.5-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.5-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.5-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.5-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.5/panel-rs-riscv64-linux')

sha256sums_x86_64=('94fad2a0770b6963d09d51dc8e70481cb8b62bac0f0c51948b38b657f58cba5d')
sha256sums_aarch64=('0239a734d66ef021356efc77a5fbc59793f7703b3c3d332a0994591c2c66d017')
sha256sums_powerpc64le=('33f2d5ef8e055c8489d38d647cdb4379ce8f798e40484174781079392efd758b')
sha256sums_riscv64=('b9e73818aada73eb0038cc1bf58a5c3f9a8388cc39a62cfd0892e7e68203bdb1')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.5-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
