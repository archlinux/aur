# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-wings-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='Game server node daemon'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('wings-rs-1.2.4-x86_64::https://github.com/calagopus/wings/releases/download/release-1.2.4/wings-rs-x86_64-linux')
source_aarch64=('wings-rs-1.2.4-aarch64::https://github.com/calagopus/wings/releases/download/release-1.2.4/wings-rs-aarch64-linux')
source_powerpc64le=('wings-rs-1.2.4-ppc64le::https://github.com/calagopus/wings/releases/download/release-1.2.4/wings-rs-ppc64le-linux')
source_riscv64=('wings-rs-1.2.4-riscv64::https://github.com/calagopus/wings/releases/download/release-1.2.4/wings-rs-riscv64-linux')

sha256sums_x86_64=('e55895b5b8a93537d8603e1bc4811fc00cfc91107a4f44a69e8939b4a7ddfeb1')
sha256sums_aarch64=('8ac114cba30ef21ddc1123e4ea77886f92a4ec6909af182de59e43cb54b44e91')
sha256sums_powerpc64le=('92bf5a3fe1681935dba84aee9b0d524382a06a1f5dcbf4a71e45a4ac2a8f99fa')
sha256sums_riscv64=('e7c3f82fcb231cead922b12f608dabd11e99ba1e69806ce09c9c34e044d9f070')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/wings-rs-1.2.4-${_a}" "${pkgdir}/usr/bin/calagopus-wings"
}
