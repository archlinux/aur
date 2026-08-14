# Maintainer: Marvin Zhang <marvin.beeblebrox@gmail.com>
pkgname=z85-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A base64-compatible Z85 CLI tool written in Rust (pre-built binary)"
arch=(x86_64 aarch64)
url="https://github.com/nirvam/z85"
license=(MIT)
depends=(gcc-libs)
provides=(z85)
conflicts=(z85)
options=(!debug)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/z85-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/z85-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=(30753e714e7312ab51b8c2c879f2bd6d45639f377addf490e41328635d02007f)
sha256sums_aarch64=(fb05eb4af24384a1c11b691c2cb76b4a1fc20d7ec4a75ae87ee78a81a3c5648c)

package() {
  install -Dm755 "$srcdir/z85" "$pkgdir/usr/bin/z85"
  install -Dm644 "$srcdir/z85.1" "$pkgdir/usr/share/man/man1/z85.1"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Shell completions
  install -Dm644 "$srcdir/completions/bash/z85" "$pkgdir/usr/share/bash-completion/completions/z85"
  install -Dm644 "$srcdir/completions/zsh/_z85" "$pkgdir/usr/share/zsh/site-functions/_z85"
  install -Dm644 "$srcdir/completions/fish/z85.fish" "$pkgdir/usr/share/fish/vendor_completions.d/z85.fish"
}
