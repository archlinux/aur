pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL Auth proxy"
pkgver=2.14.3
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

sha256sums_i686=('11f782cb75c199eb3aa8efbc716b08b31b6c1ad8de4e2b80d97ea9cb2dea17b8')
sha256sums_x86_64=('75e7cc1f158ab6f97b7810e9d8419c55735cff40bc56d4f19673adfdf2406a59')
sha256sums_aarch64=('d0bcb4225e352c599733014054274beb1693deba55e50dc52cc8540aa9c76216')

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud-sql-proxy"
}
