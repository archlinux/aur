# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.1.0-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.1.0/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.1.0-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.1.0/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.1.0-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.1.0/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.1.0-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.1.0/db-agent-riscv64-linux')

sha256sums_x86_64=('de7142dfc873feee15cdf03f119440ce16859e777539655fa2d9b20370fa6b6a')
sha256sums_aarch64=('619e6048b373703eb375a78526aff406228b378a7c1ea834cafea62efae4e355')
sha256sums_powerpc64le=('c93e22531b8e961804e656a2702be05dfe34a10337724312f5f51041fcf2f799')
sha256sums_riscv64=('f933440ffb5ae364cf0f7688c653b2b14a155a386a2801383fe776ce6eac620b')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.1.0-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
