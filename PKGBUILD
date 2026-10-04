# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.2.2-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.2.2/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.2.2-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.2.2/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.2.2-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.2.2/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.2.2-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.2.2/db-agent-riscv64-linux')

sha256sums_x86_64=('d53954e80957a92506a19c3c4a42f1525f118245787c015058eb8b88cf371080')
sha256sums_aarch64=('ce0d3b4646aadd3160844c5195632a0e3f7579246ed96514850fa34760ffe186')
sha256sums_powerpc64le=('7223910f265b4b287804a38c0f8fdd5043deaa59355db7641a620d35f1094126')
sha256sums_riscv64=('1fc633b3fef633d761653e2b5b6276273830f9a38193bad78b588ade9cb6dd65')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.2.2-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
