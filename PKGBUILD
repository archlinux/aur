# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the tidemail repository, not this file.

pkgname=tidemail-bin
pkgver=1.0.21
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
sha256sums_x86_64=('6e1be5415164ffb67d9645b3f7cb038c1c933426e52c0cb4fab0b09af86906f7')
sha256sums_aarch64=('18165f0595729e261dc8e4a9a78c46ed85fd14bcc7476f1e2e4eee440429c0cc')

package() {
  install -Dm755 "$srcdir/tidemail-linux-$CARCH" "$pkgdir/usr/bin/tidemail"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
