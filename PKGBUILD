# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=midi-hook
pkgver=0.3.0
pkgrel=1
pkgdesc="Map MIDI notes to keyboard shortcuts and shell commands"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/midi-hook"
license=('MIT')
depends=('alsa-lib' 'gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/$pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('c86ed3c7e9097431e038ab28b132fb242038a129d091bd3be4bf8f16cd1ef881')
sha256sums_aarch64=('e03d4cd07016804847964561670481384640d41242ddf88f842a836f76f28202')

package() {
  install -Dm755 midi-hook "$pkgdir/usr/bin/midi-hook"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 commands.conf.example "$pkgdir/usr/share/doc/$pkgname/commands.conf.example"
}
