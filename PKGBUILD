pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL Auth proxy"
pkgver=2.21.0
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
provides=(cloud-sql-proxy=$pkgver)
_bin_file=cloud-sql-proxy-$pkgver
source_i686=($_bin_file-i686::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.386)
source_x86_64=($_bin_file-x86_64::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.amd64)
source_aarch64=($_bin_file-aarch64::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.arm64)

sha256sums_i686=('79f9228cf4c1e92d97ae5f5818fa2d088b098f39f88f4089d937ab20f1247e80')
sha256sums_x86_64=('d1138f919f5a1761402b1505d6f9d699daa20ab4c8f8286cf0c1a2064b7826cb')
sha256sums_aarch64=('99f38872e4f794bd2958cd195eb0ea3607de6775ae7901696e6347d97f1ea7ff')

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud-sql-proxy"
}
