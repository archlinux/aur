# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-panel-bin
pkgver=1.2.9
pkgrel=1
pkgdesc='Web panel for managing game servers'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')
conflicts=('calagopus-panel-aio-bin')

source_x86_64=('panel-rs-1.2.9-x86_64::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-x86_64-linux')
source_aarch64=('panel-rs-1.2.9-aarch64::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-aarch64-linux')
source_powerpc64le=('panel-rs-1.2.9-ppc64le::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-ppc64le-linux')
source_riscv64=('panel-rs-1.2.9-riscv64::https://github.com/calagopus/panel/releases/download/release-1.2.9/panel-rs-riscv64-linux')

sha256sums_x86_64=('19518d87c382c86f1ea75069c2e2f9ff3bcfbb9910385ca77d414a15a0a9ade2')
sha256sums_aarch64=('4c51726561e49961cdffb364abd9d6cbf4c3f5df95e3e0140ea3b9bb0cb4d5f7')
sha256sums_powerpc64le=('cebdca9211d5b6c665e10de3c5b4b4c733fa0adb774a920a03404b3b2f928cbf')
sha256sums_riscv64=('44557d70702211a520d6bd843d43ac0fbc7bb88c5c22893c85020d8df5c2712e')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/panel-rs-1.2.9-${_a}" "${pkgdir}/usr/bin/calagopus-panel"
}
