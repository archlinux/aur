# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL Auth proxy"
pkgver=1.33.1
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
provides=('cloud-sql-proxy=$pkgver')
_bin_file=cloud_sql_proxy-$pkgver
source_i686=($_bin_file-i686::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.386)
source_x86_64=($_bin_file-x86_64::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.amd64)
source_aarch64=($_bin_file-aarch64::https://storage.googleapis.com/cloudsql-proxy/v$pkgver/cloud_sql_proxy.linux.arm64)

sha256sums_i686=('3405a6e94290c2c6c32ae667c7b36d27d11f1fc3e78f41368b7e064184a1e037')
sha256sums_x86_64=('fb66afb1cb8ee730314088eb7b299398bda6c0434b9b383b27a26b8951e775c5')
sha256sums_aarch64=('834ecd08f54960ee88121ab70b05002bcfb99cd08a63bcd7a1a952c53e30a3ca')

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud_sql_proxy"
}
