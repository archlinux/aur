# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=nano-agent
pkgver=0.5.0
pkgrel=1
pkgdesc="Tiny shell agent for OpenAI-compatible APIs"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/nano-agent"
license=('MIT')
depends=('bubblewrap' 'gcc-libs')
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('b5a0af9517f35a016631742a0e79e31129f5de27b29b7e72fa953d264d912721')
sha256sums_aarch64=('2008d9c62413967ca49c2ecd2cc4fcd82a56af3bc39790206d0aa62aa7f3d87f')

package() {
  install -Dm755 "nano-agent" "$pkgdir/usr/bin/nano-agent"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "QUICK_START.md" "$pkgdir/usr/share/doc/$pkgname/QUICK_START.md"
  install -Dm644 "example_config.json" "$pkgdir/usr/share/doc/$pkgname/example_config.json"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
