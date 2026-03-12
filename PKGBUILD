# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgbase=replication-manager-bin
pkgname=(
    # CLI client only
    $pkgbase-cli
    # Arbitrator - Arbitration for replication-manager clustering
    $pkgbase-arb
    # Embedded - Standalone binary with embedded web dashboard and all assets
    $pkgbase
)
pkgver=3.1.21
pkgrel=1
pkgdesc='Replication Manager for MySQL / MariaDB / Percona Server'
arch=('x86_64' 'aarch64')
url='https://github.com/signal18/replication-manager'
license=('GPL-3.0-or-later')
depends=(glibc)

case ${CARCH} in
  x86_64) _CARCH='amd64' ;;
  aarch64) _CARCH='arm64' ;;
esac

source_x86_64=(
  "$url/releases/download/v$pkgver/${pkgbase%-*}-cli-linux-$_CARCH.tar.gz"
  "$url/releases/download/v$pkgver/${pkgbase%-*}-arb-linux-$_CARCH.tar.gz"
  "$url/releases/download/v$pkgver/${pkgbase%-*}-linux-$_CARCH.tar.gz"
)

source_aarch64=(
  "$url/releases/download/v$pkgver/${pkgbase%-*}-cli-linux-$_CARCH.tar.gz"
  "$url/releases/download/v$pkgver/${pkgbase%-*}-arb-linux-$_CARCH.tar.gz"
  "$url/releases/download/v$pkgver/${pkgbase%-*}-linux-$_CARCH.tar.gz"
)

sha256sums_x86_64=('b6ae40cae1fb79f890aff99a14824b31595ba71df496412f1eead756410c26cc'
                   '1cd783d5ad8a6cfc1277f1adc9fc27c25da28f497773cd5a95d478cfd0bdb16f'
                   'aba03007409ef2b3ad326f383e3a6d7911052c453c573cb88c796d053591a982')
sha256sums_aarch64=('b6ae40cae1fb79f890aff99a14824b31595ba71df496412f1eead756410c26cc'
                    '1cd783d5ad8a6cfc1277f1adc9fc27c25da28f497773cd5a95d478cfd0bdb16f'
                    'aba03007409ef2b3ad326f383e3a6d7911052c453c573cb88c796d053591a982')


package_replication-manager-bin-cli() {
  pkgdesc='Replication Manager for MySQL / MariaDB / Percona Server - CLI client only'
  install -Dm755 "${pkgname/-bin/}-linux-$_CARCH" "$pkgdir/usr/bin/${pkgname/-bin/}"
}

package_replication-manager-bin-arb() {
  pkgdesc='Replication Manager for MySQL / MariaDB / Percona Server - Arbitration for replication-manager clustering'
  install -Dm755 "${pkgname/-bin/}-linux-$_CARCH" "$pkgdir/usr/bin/${pkgname/-bin/}"
}

package_replication-manager-bin() {
  pkgdesc='Replication Manager for MySQL / MariaDB / Percona Server - Standalone binary with embedded web dashboard and all assets'
  install -Dm755 "${pkgname/-bin/}-linux-$_CARCH" "$pkgdir/usr/bin/${pkgname/-bin/}"
}

