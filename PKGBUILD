# Maintainer: he11ah0und
#
# Binary (-bin) package: installs the prebuilt GUI binary produced by the
# release CI, so no Go/npm/Wails toolchain is needed at build time.
# The CLI package is intentionally not published yet (GUI-only release).
#
# Before publishing: pick a real license (the repo ships no LICENSE file).
pkgname=sing-box-ez-gui-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="GUI client for the sing-box proxy core (prebuilt binary)"
arch=('x86_64')
url="https://github.com/he11ah0und/sing-box-ez"
license=('GPL3')
depends=('webkitgtk-6.0' 'gtk4')
provides=('sing-box-ez-gui' 'sing-box-ez')
conflicts=('sing-box-ez-gui' 'sing-box-ez')
source=("$pkgname-$pkgver::https://github.com/he11ah0und/sing-box-ez/releases/download/v$pkgver/sing-box-ez-amd64-linux-gcc-gui-aur"
        "sing-box-ez.desktop"
        "appicon.png")
# The first entry is refreshed by the publish workflow on every release.
sha256sums=('99db1ba23027d5d1180bc7b2eca72b1bc178142015888b03d7e7480e841d4dc6' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/sing-box-ez"
  install -Dm644 "$srcdir/sing-box-ez.desktop" "$pkgdir/usr/share/applications/sing-box-ez.desktop"
  install -Dm644 "$srcdir/appicon.png" "$pkgdir/usr/share/pixmaps/sing-box-ez.png"
}
