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
pkgver=3.1.22
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

sha256sums_x86_64=('6e65a24863dd5482ae133ec631da15e074067dafe67d8ea9ceee5c6acff841d9'
                   '1c4d90baf4446ce7c4699bce8eed1607d3b0546d2e0b3782ac746da72601d035'
                   '9c17ef4029a2b55faa75174197e545a1546667647fd33d4a2c9593413190f130')
sha256sums_aarch64=('6e65a24863dd5482ae133ec631da15e074067dafe67d8ea9ceee5c6acff841d9'
                    '1c4d90baf4446ce7c4699bce8eed1607d3b0546d2e0b3782ac746da72601d035'
                    '9c17ef4029a2b55faa75174197e545a1546667647fd33d4a2c9593413190f130')


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

