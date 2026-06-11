# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nano-agent
pkgver=0.2.0
pkgrel=1
pkgdesc="Tiny shell agent for OpenAI-compatible APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/nano-agent"
license=('MIT')
depends=('bubblewrap' 'gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('5abb275f5f8068931b82db0a4e89439d89f69ddde0aa0c5f78263c9fd867aa52')
sha256sums_aarch64=('263a316227adf80677e3a2656f973be3b46cb041dd8321a546ac44e62acf07c2')

package() {
  install -Dm755 "nano-agent" "$pkgdir/usr/bin/nano-agent"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "QUICK_START.md" "$pkgdir/usr/share/doc/$pkgname/QUICK_START.md"
  install -Dm644 "example_config.json" "$pkgdir/usr/share/doc/$pkgname/example_config.json"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
