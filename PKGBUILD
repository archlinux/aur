# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the TideFTP repository, not this file.

pkgname=tideftp-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Keyboard-first terminal file transfer client for SFTP, FTP and FTPS with a two-pane layout and a real transfer queue"
arch=('x86_64' 'aarch64')
url="https://github.com/allisonhere/TideFTP"
license=('MIT')
provides=("tideftp=$pkgver")
conflicts=('tideftp')
optdepends=(
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
  'xsel: clipboard support on X11 (alternative to xclip)'
)
# Upstream ships a static, already-stripped binary; re-stripping it only
# produces an empty debug package.
options=('!strip' '!debug')

source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tideftp-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tideftp-linux-aarch64.tar.gz")
sha256sums=('7ded3abde5f4be92306e0ee24c6db97b1825e4eaa1b8fd473669c521f5a409dd')
sha256sums_x86_64=('d829555fe7575cc9cad2cc9791fbce5166aaba70e2fd97c29b70a3c1acc3d3d5')
sha256sums_aarch64=('333b80b705262895eb424bd4a78dacb3c8a74186cc0285e2af167b42acc03e7c')

package() {
  install -Dm755 "$srcdir/tideftp-linux-$CARCH" "$pkgdir/usr/bin/tideftp"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
