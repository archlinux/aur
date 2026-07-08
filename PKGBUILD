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
pkgver=3.1.31
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

sha256sums_x86_64=('c7150a161be7b04b7c2ddd0de5793d844a53896debff6a68b12e7ac51543f522'
                   'c805d05196cdac85878936d2c797982eb016f9bde6726c8efddf7c82da0f35cd'
                   '59da22e259127d4de3a59546bff728b95436bb5e56dd9cc4135f128181c6721d')
sha256sums_aarch64=('f98ef6b6fb7d93611fd848292e4f0eae59765b5ecb6d2a79453747e2f5525c3b'
                    'f0d6a1783d434d900a0fc9b8ae422843b95e1afb15986cea8c20fd40bb6a0d57'
                    '0e52beb9eb5956dd07d6db28aa7e92977de06faf0ad47c330e92b03575c1d832')

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
