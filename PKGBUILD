# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.4.10
_pkgver=0.4.1
pkgrel=1
pkgdesc='Unofficial CLI for Toggl Track written in Rust, using the v9 API.'
arch=(x86_64)
url=https://github.com/watercooler-labs/toggl-cli
license=(MIT)
depends=(openssl)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/toggl-x86_64-unknown-linux-gnu-$_pkgver.zip
	$pkgname-$pkgver.sha256::$url/releases/download/v$pkgver/x86_64_linux.sha256
)
sha256sums=('076628e116d797097ab18a7c8426c0f5d46d64ef16784dc46d93849359c47294'
            '7b1653ccf3a4f516a99f3d973845cf35ea6b1258b675bc1afdf765442f51339f')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
}
