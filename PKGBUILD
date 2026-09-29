# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the tidemail repository, not this file.

pkgname=tidemail-bin
pkgver=1.1.1
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

source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
        "tidemail-$pkgver.png::$url/raw/v$pkgver/images/tidemail-icon.png"
        "tidemail-$pkgver.desktop::$url/raw/v$pkgver/packaging/linux/tidemail.desktop")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tidemail-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tidemail-linux-aarch64.tar.gz")
sha256sums=('7ded3abde5f4be92306e0ee24c6db97b1825e4eaa1b8fd473669c521f5a409dd'
            'a2510a7a5185a520ea815f8c19799055a363e2cd9c98e7c9d8ce748a703db0b6'
            '65217068259c58ac622c1ceb73acf33c96eaa0f1905a936410ac7936853d2b44')
sha256sums_x86_64=('fbd684bf33ce805525b5904a547864dd819d5f41b41971ac61b6f465da58c690')
sha256sums_aarch64=('9b9b0b3fa5130c5dd4480c1724b84c03911135d8105d897708bda929aac7dfd2')

package() {
  install -Dm755 "$srcdir/tidemail-linux-$CARCH" "$pkgdir/usr/bin/tidemail"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tidemail-$pkgver.png" "$pkgdir/usr/share/pixmaps/tidemail.png"
  install -Dm644 "$srcdir/tidemail-$pkgver.desktop" "$pkgdir/usr/share/applications/tidemail.desktop"
}
