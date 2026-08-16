# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.1.1-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.1.1/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.1.1-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.1.1/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.1.1-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.1.1/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.1.1-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.1.1/db-agent-riscv64-linux')

sha256sums_x86_64=('d62928a8cd01224b3a813f0ef79ea4882cb5812db0dcc5316fb5338d4fbc8807')
sha256sums_aarch64=('5525856dea0bff972441ff130dbe24b443a0592f677ed9bf759110dc58f3f880')
sha256sums_powerpc64le=('6968962b6fcb3d08b76c1d0bcb2c4bf4046d75ca42ea0d8bfa817b8d3f8e7501')
sha256sums_riscv64=('5185ebd9e3b0d9abb6e4c0647253045174c8585fbf7d00556bd69b7f18d8f74d')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.1.1-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
