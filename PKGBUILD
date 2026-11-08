# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.9
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.9-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.9/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.9-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.9/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.9-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.9/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.9-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.9/wings-rs-riscv64-linux')

sha256sums_x86_64=('42543fa8553fc22d6a59624b5474f088f589a715ee474f68d13af902de7b4f18')
sha256sums_aarch64=('9448a25a3dd0d34f5b2f45b52526128d4377d302894ff245bd288da51b533d3f')
sha256sums_powerpc64le=('4876d83f69b48371f295bec139e7b36fb2edbeecd06412fa57e784e2ed51a974')
sha256sums_riscv64=('fc32e431b47b046939a7089e50389ec47b754f42e9811db7311c89e7440008b1')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.9-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
