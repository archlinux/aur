# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nano-agent
pkgver=0.2.1
pkgrel=1
pkgdesc="Tiny shell agent for OpenAI-compatible APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/nano-agent"
license=('MIT')
depends=('bubblewrap' 'gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('a2e1687a1ab1f031e440b2804452f82ee1187b8f1efcccb588b59223f4e7f0fb')
sha256sums_aarch64=('30f1c425c9de55d3fbf75f666ee48603873dfe3c1c269b7c46e0ae4eaf2adfcb')

package() {
  install -Dm755 "nano-agent" "$pkgdir/usr/bin/nano-agent"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "QUICK_START.md" "$pkgdir/usr/share/doc/$pkgname/QUICK_START.md"
  install -Dm644 "example_config.json" "$pkgdir/usr/share/doc/$pkgname/example_config.json"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
