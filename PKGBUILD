# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Unofficial CLI for Toggl Track written in Rust, using the v9 API.'
arch=(x86_64)
url=https://github.com/watercooler-labs/toggl-cli
license=(MIT)
depends=(openssl)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  $pkgname-$pkgver.zip::$url/releases/download/v$pkgver/toggl-x86_64-unknown-linux-gnu-$pkgver.zip
  $pkgname-$pkgver.sha256::$url/releases/download/v$pkgver/x86_64_linux.sha256
)
sha256sums=('0f8ad14b71454c22046e579a143842ce35c5e4ff693338b45491c6f023e3d1f1'
            'ab5b3c5765f56d2d508ab4b4342c154206108e2f2ae957d2c1281c62134e12c6')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
}
