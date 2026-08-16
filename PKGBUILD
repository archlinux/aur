# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.1.4-x86_64::https://github.com/calagopus/wings/releases/download/release-1.1.4/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.1.4-aarch64::https://github.com/calagopus/wings/releases/download/release-1.1.4/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.1.4-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.1.4/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.1.4-riscv64::https://github.com/calagopus/wings/releases/download/release-1.1.4/wings-rs-riscv64-linux')

sha256sums_x86_64=('5aece165b1e426581fdfb6912729d86866a9b017ad34a4185605a64c1036ec28')
sha256sums_aarch64=('c5a214374cd316da79036317c42b908348ab573db9ad1d679ea8db6c8190fbc4')
sha256sums_powerpc64le=('582f836c30b99fdec444124ab77ca74a7bdebb350d86fd634b34a766dee88843')
sha256sums_riscv64=('2416ad44f07ff79743fbc33570f66677e43b53cc1347ecd2d67a52b0ed08d260')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.1.4-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
