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
pkgver=3.1.34
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

sha256sums_x86_64=('ab611bae5aabf700a6868b823fb733db6124833bba7a6248bc88cab2e4c3b88f'
                   'b7bc1319675376ba36d61e2112274b9806de66225b728d46799d872b9f8a6744'
                   '4ab55e7188057abf8bbb4d44d8865b7042988cf8a904fcbf42c267adafbf2bfd')
sha256sums_aarch64=('501431d14548d2cf7426f1e79cdb3106429d690212abb951133489851f0b5f31'
                    '4a27af8ff2d8c368c7c679a7d9bbab7eb864b9665e8c6bc33c8990b3254599f6'
                    '841ea8e3be812c6fef9eff8aa1e3e4acb5c68ebaeb9e6b07d1dbc02cc02c9e49')

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
