# Maintainer: Allie Bayless <drbayless@gmail.com>
#
# Generated from packaging/aur/PKGBUILD.in by packaging/aur/render-pkgbuild.sh.
# Edit the template in the tidemail repository, not this file.

pkgname=tidemail-bin
pkgver=1.0.27
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
sha256sums_x86_64=('db2e33ab2b0fdd25fdd4434611db04d10f25f2647bdb513d1d0d5f4b54a9a61d')
sha256sums_aarch64=('a9fe218c1a011250bd8fc3ba45e52830faaeb0dbc56df009ea0591454983a000')

package() {
  install -Dm755 "$srcdir/tidemail-linux-$CARCH" "$pkgdir/usr/bin/tidemail"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/tidemail-$pkgver.png" "$pkgdir/usr/share/pixmaps/tidemail.png"
  install -Dm644 "$srcdir/tidemail-$pkgver.desktop" "$pkgdir/usr/share/applications/tidemail.desktop"
}
