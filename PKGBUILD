# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.1.1-x86_64::https://github.com/calagopus/wings/releases/download/release-1.1.1/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.1.1-aarch64::https://github.com/calagopus/wings/releases/download/release-1.1.1/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.1.1-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.1.1/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.1.1-riscv64::https://github.com/calagopus/wings/releases/download/release-1.1.1/wings-rs-riscv64-linux')

sha256sums_x86_64=('3612a016a166b83cedd11319d56d95ab94d470a537c1295e795ed5c8c746941b')
sha256sums_aarch64=('6096e9bc85d8fdd518426bb1b2bb4fefd3134e6bf8b0b2aed6d53f2027446bde')
sha256sums_powerpc64le=('1dc11f4e1151ef538042b2d2161fe05958482fbd2f4e5fad83f50e54991b0c4d')
sha256sums_riscv64=('d97f3421938ba11a21dc5d41a25f0c39f3fa9192a70e6f27f75348fd327532fd')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.1.1-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
