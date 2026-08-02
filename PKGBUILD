# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.1.2-x86_64::https://github.com/calagopus/wings/releases/download/release-1.1.2/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.1.2-aarch64::https://github.com/calagopus/wings/releases/download/release-1.1.2/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.1.2-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.1.2/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.1.2-riscv64::https://github.com/calagopus/wings/releases/download/release-1.1.2/wings-rs-riscv64-linux')

sha256sums_x86_64=('bf56176472e8e4aa418c0422be8904a73182437e61b2a2fb17350173f3c69153')
sha256sums_aarch64=('bdc91aa01354d972951b77e028eb7b550120cb854ac5738aa8503e1fdc8003b5')
sha256sums_powerpc64le=('e94cd8fc139b1813accd1e27b9fcc21baed0b9ffb1b6aab9127662220188757b')
sha256sums_riscv64=('816c0f484a1808f9a3d0b77677e6cc1044085828bb441ba611dc213b1e384346')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.1.2-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
