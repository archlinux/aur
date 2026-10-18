# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.6
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.6-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.6/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.6-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.6/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.6-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.6/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.6-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.6/panel-rs-riscv64-linux')

sha256sums_x86_64=('6a3153ad88f89d2b62ea36ac4df3920f763ad85238665e8b6e9e6290ddaaf0cd')
sha256sums_aarch64=('2a5238f9db9485974ebfbed7248a3848f50347adccca32a9efecc635f1e31fac')
sha256sums_powerpc64le=('b8c535c504452272f0e0ada146c216928a273fcf185261ef1b766581a679c457')
sha256sums_riscv64=('f0248760f2ccbaa2de7603478e6b1d625e68dab5bbb7c9cd1813472a8ca72149')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.6-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
