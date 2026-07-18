# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.0.0/db-agent-x86_64-linux')
source_aarch64=('db-agent-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.0.0/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.0.0/db-agent-ppc64le-linux')
source_riscv64=('db-agent-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.0.0/db-agent-riscv64-linux')

sha256sums_x86_64=('0af2b984b7eb69262e0e17e968baf163aca70ac682dbdc559b29746ac03ae718')
sha256sums_aarch64=('b628fe399564f79da6a4e53d6abc5317a4ebba0056aa0a40be1016f0dc2718c8')
sha256sums_powerpc64le=('ed3f747f29b3f0efcbb7161b67e21761652e98ef0baa8ace7fb4436a65236c19')
sha256sums_riscv64=('739ae6679cfa2d5db1f14ce1227ddddd26d30070a61ad299b4b7340bee9c5f10')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
