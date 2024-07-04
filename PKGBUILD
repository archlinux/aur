# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.4.4
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
sha256sums=('e82a1830efefef39b35c8c80a2f4f2e67d98885fe365aad061ba2eeaeba8db30'
            'e161dfb3f4a0699acb2839f42d5b09c8324009498e339cbd87475a21f20925a8')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
}
