# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.2.1-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.2.1/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.2.1-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.2.1/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.2.1-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.2.1/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.2.1-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.2.1/db-agent-riscv64-linux')

sha256sums_x86_64=('0676ea78572c9ec045340428105b2612d9d3ae2abad9897a00cb8dd17746ec47')
sha256sums_aarch64=('33acf518fd58734dc2d29dec23c6ca710d37e43a4e1d5ced720d9baf5275e4dd')
sha256sums_powerpc64le=('f04f994bc9b9ed8ef6a25e7f367a54e6991dfc078bef9a99e6fcfbca78151c0e')
sha256sums_riscv64=('fc222a9c9ecfa6eff16a859030fe6ad59ed8f32fd909a9917450e95bb8830a9f')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.2.1-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
