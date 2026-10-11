# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.2.3
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.2.3-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.2.3/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.2.3-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.2.3/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.2.3-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.2.3/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.2.3-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.2.3/db-agent-riscv64-linux')

sha256sums_x86_64=('06716fe65b7b8ec5d910809566dadce6436124ce9447b03c92bd1a79aeeb79f1')
sha256sums_aarch64=('77467f2ba1d4b9b284ed5871bb02b17175cfbfb95b0855d8d2df2acbab9f18dc')
sha256sums_powerpc64le=('9ddab24fd7e6916129f5347862d584ae6c9754755499d36334b758a588072cae')
sha256sums_riscv64=('c39c583635f0d6863063e2f7d37b34d96e9819c13f410f9e246c419b5014bcb0')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.2.3-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
