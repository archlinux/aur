# Maintainer: Takase <takase1121 at proton dot me>
# Contributor: Koolaid <hasoy678 at gmail dot com>
# Based on metrolist-desktop-bin (https://aur.archlinux.org/packages/metrolist-desktop-bin)


pkgname=metrolist-desktop-nightly-bin
pkgver=20261115.r56.g2623ab7
pkgrel=2
pkgdesc="YouTube Music client for desktop (nightly)"
arch=('x86_64')
url="https://github.com/MetrolistGroup/Metrolist"
license=('GPL-3.0-or-later')
depends=('fuse2')
options=('!debug' '!strip')
noextract=("metrolist-nightly.AppImage")
source=(
  "metrolist-nightly.AppImage::https://github.com/MetrolistGroup/Metrolist/releases/download/nightly/metrolist-desktop-linux-x64.AppImage"
  'metrolist-nightly'
  'metrolist-nightly.desktop'
  'LICENSE'
  'metrolist-nightly.png'
)
sha256sums=('c0a78f8527a1f38e7760b7dcd0d49062cd1bb58a18f8824c9310d644a3ca8de4'
            '145d0f22f04a8919f200a2e955aebcd9e030b35d398681cf38537d382f802972'
            'ea6e0ddcf16aa42cefeb1eae530375af2730e9c0f0d4797f18b407cd6ab3fc00'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'f0d70d56d2362c5f567ae732ffcd67a7376f7902b79ca2b60f95e08166ffa367')

package() {
  install -Dm755 "$srcdir/metrolist-nightly.AppImage" \
    "$pkgdir/opt/${pkgname}/metrolist-nightly.AppImage"
  install -Dm755 "$srcdir/metrolist-nightly" \
    "$pkgdir/usr/bin/metrolist-nightly"
  install -Dm644 "$srcdir/metrolist-nightly.desktop" \
    "$pkgdir/usr/share/applications/metrolist-nightly.desktop"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/metrolist-nightly.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/metrolist-nightly.png"
}
