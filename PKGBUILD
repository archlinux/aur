# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=toggl-cli-bin
pkgver=0.5.1
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
sha256sums=('f7349719c66784e23a124cde10aec94ff5d38e256c7b7ab1e246cba164ed7652'
            'f906d557a73817f17d2bd79f9b7b52388fa50bb599697e5fe25a0d74445b7f64')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%%-*}"
}
