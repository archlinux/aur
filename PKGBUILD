pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL Auth proxy"
pkgver=2.1.1
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
provides=(cloud-sql-proxy=$pkgver)
install=$pkgname.install
_bin_file=cloud-sql-proxy-$pkgver
source_i686=($_bin_file-i686::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.386)
source_x86_64=($_bin_file-x86_64::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.amd64)
source_aarch64=($_bin_file-aarch64::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.arm64)

sha256sums_i686=('dd89b6141bf9a2f688b4c37c939e0b9a16a5dce5968ee737a3099fe1b3b5d00c')
sha256sums_x86_64=('60ae4f1e4d45e990bdca12b2fb36767508b6c4da7c59d1510ebbb400f6c8ada5')
sha256sums_aarch64=('a6b6b14b165903935a9f6e98a63739c15b54ae60b5b9abc09a23be90ca4b4e99')

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud-sql-proxy"
}
