# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the tide repository, not this file.

pkgname=tide-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Terminal RSS reader built with Bubble Tea"
arch=('x86_64' 'aarch64')
url="https://github.com/allisonhere/tide"
license=('MIT')
provides=("tide=$pkgver")
conflicts=('tide')
optdepends=(
  'xdg-utils: open articles in a browser'
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
  'xsel: clipboard support on X11 (alternative to xclip)'
)
# Upstream ships a static, already-stripped binary; re-stripping it only
# produces an empty debug package.
options=('!strip' '!debug')

source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tide-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tide-linux-aarch64.tar.gz")
sha256sums=('7ded3abde5f4be92306e0ee24c6db97b1825e4eaa1b8fd473669c521f5a409dd')
sha256sums_x86_64=('3d0cdb4ddabb6617dd1db83e3e93d44016dda5d61eac1b3a9da1753210a83a7f')
sha256sums_aarch64=('fe8484ac68d3733a8d7c092aa645274db72688756f27d2acd2e97ee3cd9d232d')

package() {
  install -Dm755 "$srcdir/tide-linux-$CARCH" "$pkgdir/usr/bin/tide"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
