pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL Auth proxy"
pkgver=2.26.0
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
provides=(cloud-sql-proxy=$pkgver)
_bin_file=cloud-sql-proxy-$pkgver
source_i686=($_bin_file-i686::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.386)
source_x86_64=($_bin_file-x86_64::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.amd64)
source_aarch64=($_bin_file-aarch64::https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v$pkgver/cloud-sql-proxy.linux.arm64)

sha256sums_i686=('e5feaad5892fb0ae2409ef406ca27b2e80e0179e15ac5fc9c34525f6f6320b4a')
sha256sums_x86_64=('a38fe97690a27490e60a7945a8a178186ff9464abb81fe2bc652a3f773443387')
sha256sums_aarch64=('38a61b2d55ac5e0b3924561696f599003b50100baedbfe4730a0410713f3e2cd')

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud-sql-proxy"
}
