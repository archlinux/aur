# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nano-agent
pkgver=0.4.0
pkgrel=1
pkgdesc="Tiny shell agent for OpenAI-compatible APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/nano-agent"
license=('MIT')
depends=('bubblewrap' 'gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('cb4fee8a407f9082e4dc61cb670f366243082c209f93116443ebf82cb71f722c')
sha256sums_aarch64=('5d0cd0ff0bc74397e739e53a8cb7ebd18e9e189dbf6a66a8565441f6f3793fd1')

package() {
  install -Dm755 "nano-agent" "$pkgdir/usr/bin/nano-agent"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "QUICK_START.md" "$pkgdir/usr/share/doc/$pkgname/QUICK_START.md"
  install -Dm644 "example_config.json" "$pkgdir/usr/share/doc/$pkgname/example_config.json"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
