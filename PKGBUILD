# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the tidemail repository, not this file.

pkgname=tidemail-bin
pkgver=1.0.25
pkgrel=1
pkgdesc="Keyboard-first terminal email client with multi-account mail, a unified inbox, drafts, contacts, search, and optional AI tools"
arch=('x86_64' 'aarch64')
url="https://github.com/allisonhere/tidemail"
license=('MIT')
provides=("tidemail=$pkgver")
conflicts=('tidemail')
optdepends=(
  'xdg-utils: open links and attachments in a desktop application'
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
  'xsel: clipboard support on X11 (alternative to xclip)'
  'libnotify: desktop notifications for new mail'
)
# Upstream ships a static, already-stripped binary; re-stripping it only
# produces an empty debug package.
options=('!strip' '!debug')

source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tidemail-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tidemail-linux-aarch64.tar.gz")
sha256sums=('7ded3abde5f4be92306e0ee24c6db97b1825e4eaa1b8fd473669c521f5a409dd')
sha256sums_x86_64=('9932c46269980cc9d650292381eed8948dd8e6b74800a1216476f06e593786b2')
sha256sums_aarch64=('fd783613f6af4b03753dda873ab10de56a06b8e4bef4547e062f09a1b202ea49')

package() {
  install -Dm755 "$srcdir/tidemail-linux-$CARCH" "$pkgdir/usr/bin/tidemail"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
