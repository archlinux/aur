# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Unofficial CLI for Toggl Track written in Rust, using the v9 API.'
arch=(x86_64)
url=https://github.com/watercooler-labs/toggl-cli
_rawurl="${url/github.com/raw.githubusercontent.com}/refs/tags/v$pkgver"
license=(MIT)
depends=(openssl)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/toggl-x86_64-unknown-linux-gnu-$pkgver.zip"
  "$pkgname-$pkgver.sha256::$url/releases/download/v$pkgver/x86_64-unknown-linux-gnu.sha256"
  "LICENSE_$pkgver::$_rawurl/LICENSE.md"
)
sha256sums=('cd2e3c06973da393d350aa6fa3116fd3b7ef48bdae5976d28bd2c94129dc5712'
            '8d2b596053f89d917686c582f681b06f0992aaff2e4f41e1ef65f8e3105578cf'
            'be8efd1a409a68795d48504036a83ed0293016524f8d79565f45d47b3a0c82da')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
