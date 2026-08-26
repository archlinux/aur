# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=midi-hook
pkgver=0.4.2
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

sha256sums_x86_64=('57ff6ef7f0fdc8876c5cc1ba3237b4f7ac4a938a339b142abb29a7563d4b1b56')
sha256sums_aarch64=('e33d18058385a6d168a766b7fde0705a4f889e9f06283e696c9f833c34e2ad88')

package() {
  install -Dm755 midi-hook "$pkgdir/usr/bin/midi-hook"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 REFERENCE.md "$pkgdir/usr/share/doc/$pkgname/REFERENCE.md"
  install -Dm644 commands.conf.example "$pkgdir/usr/share/doc/$pkgname/commands.conf.example"
  install -Dm644 midi-hook.service "$pkgdir/usr/lib/systemd/user/midi-hook.service"
}
