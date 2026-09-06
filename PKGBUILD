# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.2.0-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.2.0/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.2.0-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.2.0/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.2.0-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.2.0/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.2.0-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.2.0/db-agent-riscv64-linux')

sha256sums_x86_64=('cf7039ad0c11dffba37197b1196bcfe454740e895ae404af8caaa48985a7364f')
sha256sums_aarch64=('d8a701ef7538d9d5f7178b9e9b43d55d133ed9cf059f49a3431e833438b72d24')
sha256sums_powerpc64le=('9314885c6738a71d0a094a08d8eae7e60275b2cca7bfbdf429b62844c1bcbc5a')
sha256sums_riscv64=('bc608c0d158773fa4b9f556baf2d780e5e4dee871b3e6262293682c078941f25')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.2.0-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
