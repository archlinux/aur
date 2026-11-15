# Maintainer: Takase <takase1121 at proton dot me>
# Contributor: Koolaid <hasoy678 at gmail dot com>
# Based on metrolist-desktop-bin (https://aur.archlinux.org/packages/metrolist-desktop-bin)


pkgname=metrolist-desktop-nightly-bin
_pkgver=14.0.0+2623ab7
pkgver=14.0.0+2623ab7
pkgrel=1
pkgdesc="YouTube Music client for desktop (nightly)"
arch=('x86_64')
url="https://github.com/MetrolistGroup/Metrolist"
license=('GPL-3.0-or-later')
depends=('fuse2')
options=('!strip')
noextract=("metrolist-${_pkgver}.AppImage")
source=(
  "metrolist-${_pkgver}.AppImage::https://github.com/MetrolistGroup/Metrolist/releases/download/nightly/metrolist-desktop-linux-x64-${_pkgver}.AppImage"
  'metrolist-nightly'
  'metrolist-nightly.desktop'
  'LICENSE'
  'metrolist-nightly.png'
)
sha256sums=('545107a8fcac870d730f6f43744279017f95f140fb9c4bad0e97139bf7522b15'
            '145d0f22f04a8919f200a2e955aebcd9e030b35d398681cf38537d382f802972'
            'ea6e0ddcf16aa42cefeb1eae530375af2730e9c0f0d4797f18b407cd6ab3fc00'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'f0d70d56d2362c5f567ae732ffcd67a7376f7902b79ca2b60f95e08166ffa367')

package() {
  install -Dm755 "$srcdir/metrolist-${_pkgver}.AppImage" \
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
