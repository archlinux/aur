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
pkgver=3.1.50
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

sha256sums_x86_64=('42735a8a7d367f80863ce9b3abaf61d1ea154b13a1c7929436da5ac07c7516a6'
                   '48cf3c6f988ee9638b2bca4faed892aee51cd28e0cacb541cf7ae1f818c46337'
                   '515a5bca6aeddff0dd2f516fe6be6025e31c2d298d813037ae10de98038c2d9f')
sha256sums_aarch64=('e1ac8a3b224796e2a83cf5fdddc2eaf21ad36d802ec2905907dee915144aa5e7'
                    '040419e1c83292326920c596c410c57f236ff9f35b3100d06389acee1bc8afd0'
                    '28d1ad0248483d10f3ab099eb72e231626147382b7569299f584fcb2578bef4f')

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
