# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=midi-hook
pkgver=0.4.0
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

sha256sums_x86_64=('df84b653b998693777734c7f35a55d81984bbfc2deb39898ca64aa47b4bcb86d')
sha256sums_aarch64=('a9ce8e26afd79e49b0422917c35858407f05c47644eba018aaef74ebd7f2668d')

package() {
  install -Dm755 midi-hook "$pkgdir/usr/bin/midi-hook"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 commands.conf.example "$pkgdir/usr/share/doc/$pkgname/commands.conf.example"
}
