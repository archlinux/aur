# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.2.5-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.2.5/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.2.5-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.2.5/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.2.5-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.2.5/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.2.5-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.2.5/db-agent-riscv64-linux')

sha256sums_x86_64=('1a184903e74b9a28aec95e792b7cd1c6e3b2bb63307cdaebc0310576d82944ab')
sha256sums_aarch64=('a22c650e4496d24b094bb99bc09a8ee4009f1f82fdd4f4e01b0e1a047fac1a55')
sha256sums_powerpc64le=('ab1489affb09871df5076c8f5a07bcc8720c0b294027b649ca3881010f56d74c')
sha256sums_riscv64=('8403a88be0fb0849a27cfc6981ad91b7e6c682993715ce0dea412012570bcc62')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.2.5-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
