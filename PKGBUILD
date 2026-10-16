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
pkgver=3.1.44
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

sha256sums_x86_64=('a3555efbd4c943f04d9ce45376bec8fe12b29def2c50f7ff7861b8ce0ce727a7'
                   '6ed00e3c7be797f89dcf9d8f83cd0b8f6a9f60e6f46e3bd7cf275863c6585c69'
                   'ac4dd063862bee1f810e6078bd597487cb90f4228faf917c7a5e061a9b85a3b6')
sha256sums_aarch64=('a5eb0419e86f4384d81a6ed6bcd85830e359fd121774fdc1785db40b7dc708b4'
                    '4e1ffe768bc7acf4aed05d2780d1eb489a36dd54f33143f2c31ec6fa2203cedd'
                    'df0d5ea1320f924cc12c8ece9b94ffd4784d72eeab0d8f6971ce3963057bdc12')

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
