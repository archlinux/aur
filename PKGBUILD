# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.6
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.6-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.6/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.6-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.6/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.6-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.6/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.6-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.6/wings-rs-riscv64-linux')

sha256sums_x86_64=('b9a2520f0b07cfbbb2c9daf5dceacc0051afbd04d9390d9cf2c3bfd4f693244d')
sha256sums_aarch64=('f37f40287cf6b709a8118844e5e2420471da6ccdae6ef481177d754b1de5c691')
sha256sums_powerpc64le=('bb7c1195f9206f85b4c1d36d7eea295098f38e08a8807cd830332a4b213ce53a')
sha256sums_riscv64=('8f61303b5e1c046b8befbb07e129689a037c7efab4633056ab62fa558ffd5797')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.6-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
