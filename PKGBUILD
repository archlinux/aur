# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=midi-hook
pkgver=0.2.0
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

sha256sums_x86_64=('263860d491e918b495986df49f917f11d10fc788b4f3c6f7c42040b6ecb54c5d')
sha256sums_aarch64=('bbca388fc6f72a5bb300e3768eba5d81d9df9fb30c413bc5980c4d1e6da67960')

package() {
  install -Dm755 midi-hook "$pkgdir/usr/bin/midi-hook"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 commands.conf.example "$pkgdir/usr/share/doc/$pkgname/commands.conf.example"
}
