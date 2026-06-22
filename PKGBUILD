# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.0.11
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-x86_64::https://github.com/calagopus/wings/releases/download/release-1.0.11/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-aarch64::https://github.com/calagopus/wings/releases/download/release-1.0.11/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.0.11/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-riscv64::https://github.com/calagopus/wings/releases/download/release-1.0.11/wings-rs-riscv64-linux')

sha256sums_x86_64=('4cf2462d448797325cc40d7d8ac6f843fc2a1bbbd40e9514d25f4412fdfb1579')
sha256sums_aarch64=('73d105f159da74589424f8204be3a0bc2b554ba2567a11a1343557fd1ca16fab')
sha256sums_powerpc64le=('7f2f508212b6fef0b2469504cf98d887d305c9d83a8d59dd5e470a39a2820710')
sha256sums_riscv64=('6a4cc30f7b2ec515e7630c05e90ee614329ab53b17ccd317eed7ca7a6d038115')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
