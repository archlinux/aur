# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=midi-hook
pkgver=0.4.1
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

sha256sums_x86_64=('d3a7c2517120c7120c6f374dadbf71e7ef32273e5e48a7e7880bcfef36504c99')
sha256sums_aarch64=('2bb02f0bd3799446e07c2f30d9e083346b223705234adc096cb65eacdc9adea5')

package() {
  install -Dm755 midi-hook "$pkgdir/usr/bin/midi-hook"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 commands.conf.example "$pkgdir/usr/share/doc/$pkgname/commands.conf.example"
  install -Dm644 midi-hook.service "$pkgdir/usr/lib/systemd/user/midi-hook.service"
}
