# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.1.5-x86_64::https://github.com/calagopus/wings/releases/download/release-1.1.5/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.1.5-aarch64::https://github.com/calagopus/wings/releases/download/release-1.1.5/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.1.5-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.1.5/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.1.5-riscv64::https://github.com/calagopus/wings/releases/download/release-1.1.5/wings-rs-riscv64-linux')

sha256sums_x86_64=('d5475ebd1423df06acb9b6ab5a1ad1f119f71bcf4e4e802f198d704a045d914e')
sha256sums_aarch64=('35876e3b3ce330c6a567bf55ef6e96a468729933961dae246008a2a876daa49e')
sha256sums_powerpc64le=('e2389d4db5f137403bd048a7538f97c527b9f320cf90959f3a94bf8f14ec0f43')
sha256sums_riscv64=('05b88f4f57a363e399fb1032c8685a5e401d43d9406cfa0a77c2d0510f6c17e6')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.1.5-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
