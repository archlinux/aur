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
pkgver=3.1.23
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
  "${pkgbase%-*}-cli-$pkgver-$_CARCH.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-cli-linux-$_CARCH.tar.gz"
  "${pkgbase%-*}-arb-$pkgver-$_CARCH.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-arb-linux-$_CARCH.tar.gz"
  "${pkgbase%-*}-$pkgver-$_CARCH.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-linux-$_CARCH.tar.gz"
)

source_aarch64=(
  "${pkgbase%-*}-cli-$pkgver-$_CARCH.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-cli-linux-$_CARCH.tar.gz"
  "${pkgbase%-*}-arb-$pkgver-$_CARCH.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-arb-linux-$_CARCH.tar.gz"
  "${pkgbase%-*}-$pkgver-$_CARCH.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-linux-$_CARCH.tar.gz"
)

sha256sums_x86_64=('8e8c01812628e7ecdb5c86a3bfaa7db4a6bebe901deff5ac3a23693c73c2bd67'
                   '65ac0046c4242b9ab6b7ca01eb501b44b69cba25cd4bbe72d87722a9de6eaeb8'
                   'c76dc6796098c9c5f3b9b4076cb961492d7a9252173219196c5d508ac081a951')
sha256sums_aarch64=('8e8c01812628e7ecdb5c86a3bfaa7db4a6bebe901deff5ac3a23693c73c2bd67'
                    '65ac0046c4242b9ab6b7ca01eb501b44b69cba25cd4bbe72d87722a9de6eaeb8'
                    'c76dc6796098c9c5f3b9b4076cb961492d7a9252173219196c5d508ac081a951')


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

