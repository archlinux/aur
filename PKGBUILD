# Maintainer: Takase <takase1121 at proton dot me>
# Contributor: Koolaid <hasoy678 at gmail dot com>
# Based on metrolist-desktop-bin (https://aur.archlinux.org/packages/metrolist-desktop-bin)


pkgname=metrolist-desktop-nightly-bin
pkgver=14.0.0+54715a5
pkgrel=1
pkgdesc="YouTube Music client for desktop (nightly)"
arch=('x86_64')
url="https://github.com/MetrolistGroup/Metrolist"
license=('GPL-3.0-or-later')
depends=('fuse2')
options=('!strip')
noextract=("metrolist-${pkgver}.AppImage")
source=(
  "metrolist-${pkgver}.AppImage::https://github.com/MetrolistGroup/Metrolist/releases/download/nightly/metrolist-desktop-linux-x64-${pkgver}.AppImage"
  'metrolist-nightly'
  'metrolist-nightly.desktop'
  'LICENSE'
  'metrolist-nightly.png'
)
sha256sums=('24c9f5cb57ed9df2ba9e5a809e24d85947b67b0aea4ccf19dc3b977d2766f70e'
            '145d0f22f04a8919f200a2e955aebcd9e030b35d398681cf38537d382f802972'
            '9af6ac01dc332caf13ae9abab2ad94e051f5ed221d3a8d9255a6e17be40c3835'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'f0d70d56d2362c5f567ae732ffcd67a7376f7902b79ca2b60f95e08166ffa367')

package() {
  install -Dm755 "$srcdir/metrolist-${pkgver}.AppImage" \
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
