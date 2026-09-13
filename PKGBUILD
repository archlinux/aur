# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.1-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.1/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.1-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.1/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.1-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.1/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.1-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.1/wings-rs-riscv64-linux')

sha256sums_x86_64=('ca92d30357baf62154b7a249fa234095a13ded150b99c1eaead017f6ff608c7e')
sha256sums_aarch64=('60c76ce9fd8c6686fcffb3c46508eccddbcd9fe223e143e0e87e87764c5d8778')
sha256sums_powerpc64le=('cb3f0ee1ef9e9d58e18308a724f589057a7048e336f81c47407ad27e8131df3e')
sha256sums_riscv64=('2278c642465c060bd13299df3ae9fdc714096f062ab0e126ec6cdc12c30a859c')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.1-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
