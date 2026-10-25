# Maintainer: Calagopus <contact@calagopus.com>
pkgname=calagopus-db-agent-bin
pkgver=1.2.4
pkgrel=1
pkgdesc='Database management agent'
arch=('x86_64' 'aarch64' 'powerpc64le' 'riscv64')
url='https://calagopus.com'
license=('MIT')

source_x86_64=('db-agent-1.2.4-x86_64::https://github.com/calagopus/db-agent/releases/download/release-1.2.4/db-agent-x86_64-linux')
source_aarch64=('db-agent-1.2.4-aarch64::https://github.com/calagopus/db-agent/releases/download/release-1.2.4/db-agent-aarch64-linux')
source_powerpc64le=('db-agent-1.2.4-ppc64le::https://github.com/calagopus/db-agent/releases/download/release-1.2.4/db-agent-ppc64le-linux')
source_riscv64=('db-agent-1.2.4-riscv64::https://github.com/calagopus/db-agent/releases/download/release-1.2.4/db-agent-riscv64-linux')

sha256sums_x86_64=('cbd6e03b0b26f414fab87d6a914a4fa3174b71210aa39c4efb7859fb343187d1')
sha256sums_aarch64=('54e32fe602ce5cfbcca8d2cbb80cd96bfc77a4f7baceb2f4913e0b54aa6897cd')
sha256sums_powerpc64le=('e61f04f96658dc3f4b530afe412e3f54db7e5ce366d0c60b5124291a07c87658')
sha256sums_riscv64=('218bfbb34bfac84daadf38c4af87929f9b03eb1118686fc6a88c54e7eda64993')

package() {
    case "$CARCH" in
        x86_64)      _a=x86_64 ;;
        aarch64)     _a=aarch64 ;;
        powerpc64le) _a=ppc64le ;;
        riscv64)     _a=riscv64 ;;
    esac
    install -Dm755 "${srcdir}/db-agent-1.2.4-${_a}" "${pkgdir}/usr/bin/calagopus-db-agent"
}
