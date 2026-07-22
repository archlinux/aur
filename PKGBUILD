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
pkgver=3.1.36
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
  "${pkgbase%-*}-cli-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-cli-linux-amd64.tar.gz"
  "${pkgbase%-*}-arb-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-arb-linux-amd64.tar.gz"
  "${pkgbase%-*}-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-linux-amd64.tar.gz"
)

source_aarch64=(
  "${pkgbase%-*}-cli-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-cli-linux-arm64.tar.gz"
  "${pkgbase%-*}-arb-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-arb-linux-arm64.tar.gz"
  "${pkgbase%-*}-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${pkgbase%-*}-linux-arm64.tar.gz"
)

sha256sums_x86_64=('448e955c0bd3c9c009953fa79830ea2e3bcf5d8cd2ae1d4ac23422b694995804'
                   '6d4c6ec142eee99a9bd47ea7a081dda4835ce8534f01a55a7424045bc073038e'
                   '855c327d786ddb0b06dc37ed5313e17c1fb8807869c7898edc43678e3b7fafe3')
sha256sums_aarch64=('7588fab3d82db130c6070b980f77a70a8dee91d41b1329e1be087bc4012a6f85'
                    'd1e5e48851be1db2eaa1e3dab72dd1c9381f9c05be3fdebca2fc460d8b26b3ec'
                    '938f093d72351801b0d3cd2fc8cf8adeaf396f70c4fd330117de630468ab09b1')

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
