# Maintainer: CPT-Dawn <ping@cptdawn.dev>
pkgname=voidlink-bin
_pkgname=voidlink
pkgver=1.1.0
pkgrel=1
pkgdesc="Keyboard-first Bluetooth manager for the terminal (TUI for BlueZ) - prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/VoidLink"
license=('MIT')
depends=('bluez' 'dbus' 'glibc' 'libgcc')
optdepends=('ttf-nerd-fonts-symbols-mono: device and status icons (or run with --no-nerd-font)'
            'pipewire-audio: connect Bluetooth headphones and speakers'
            'bluez-utils: bluetoothctl for troubleshooting')
provides=('voidlink')
conflicts=('voidlink')
install=voidlink.install
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('e0941deb07f9c6513cf3f313fd2eb77d92e30891609ccd4885197b4e65a086e6')
sha256sums_aarch64=('83295544dc7b53b3f1b0f3636fa1fd232f1644a312c8aae6f400a129d0202265')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  install -Dm755 voidlink "$pkgdir/usr/bin/voidlink"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
}
