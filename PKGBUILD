pkgname=cloud-sql-proxy-bin
pkgdesc="Google Cloud SQL Auth proxy"
pkgver=2.2.0
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

sha256sums_i686=('b3da220aeffbd08f1fe88e11ba2756182423665804aab131c97469a118fc742c')
sha256sums_x86_64=('b742f2e3a992f944e4c2f055439a5b8a6e28a3e84c864757bbe25d077728218a')
sha256sums_aarch64=('60251c0cef09464ea2f658f3561cd5a00c92718320cf347522efce9f396b1191')

package() {
  install -Dm755 "$srcdir/$_bin_file-$CARCH" "$pkgdir/usr/bin/cloud-sql-proxy"
}
