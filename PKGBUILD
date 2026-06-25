# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nano-agent
pkgver=0.2.2
pkgrel=1
pkgdesc="Tiny shell agent for OpenAI-compatible APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/nano-agent"
license=('MIT')
depends=('bubblewrap' 'gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('0544c9f5e37a6a9853be361de5a93337cb6516d9c7d6b0d8522e3078af612861')
sha256sums_aarch64=('0a31e070b9591f70188cba959ea75a1ce22e8d2e7a6e4e7d73896ea613afb4cd')

package() {
  install -Dm755 "nano-agent" "$pkgdir/usr/bin/nano-agent"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "QUICK_START.md" "$pkgdir/usr/share/doc/$pkgname/QUICK_START.md"
  install -Dm644 "example_config.json" "$pkgdir/usr/share/doc/$pkgname/example_config.json"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
