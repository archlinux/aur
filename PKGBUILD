# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.4.9
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
sha256sums=('e2c95d81e0c10cd8d245ae1ba38d5bfb9467f1328289070b9d4d341b3a0e3881'
            'a32c11db5e3d651c2a78a844d05a0d09a963d5085053d69969d43d2fccacc684')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
}
