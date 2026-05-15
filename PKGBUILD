# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.5.1
pkgrel=2
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
  "$pkgname-$pkgver.sha256::$url/releases/download/v$pkgver/x86_64_linux.sha256"
  "LICENSE_$pkgver::$_rawurl/LICENSE.md"
)
sha256sums=('f7349719c66784e23a124cde10aec94ff5d38e256c7b7ab1e246cba164ed7652'
            'f906d557a73817f17d2bd79f9b7b52388fa50bb599697e5fe25a0d74445b7f64'
            'be8efd1a409a68795d48504036a83ed0293016524f8d79565f45d47b3a0c82da')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
  install -Dm644 LICENSE_$pkgver -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
