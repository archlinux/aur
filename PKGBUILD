# Maintainer: Koolaid <hasoy678@gmail.com>

pkgname=metrolist-desktop-bin
pkgver=14.0.0
pkgrel=1
pkgdesc="YouTube Music client for desktop"
arch=('x86_64')
url="https://github.com/MetrolistGroup/Metrolist"
license=('GPL-3.0-only')
depends=('fuse2')
options=('!strip')
source=(
  "metrolist-${pkgver}.AppImage::https://github.com/MetrolistGroup/Metrolist/releases/download/v${pkgver}/metrolist-desktop-linux-x64-${pkgver}.AppImage"
  'metrolist'
  'metrolist.desktop'
  'LICENSE'
)
sha256sums=(
  '0e75981e7a805ce669290edfb5537b96a4ac8951c2c3e6a50f00ed2b7896045f'
  '7e3493f95a180616ce9520273676af5849de2c912471e3e24ae8da08b3391c9e'
  '5cf901097170fa63b0d5a10bb9ec12adb93a084654724b84dbbec708e35fcf56'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  install -Dm755 "$srcdir/metrolist-${pkgver}.AppImage" \
    "$pkgdir/opt/${pkgname}/metrolist.AppImage"
  install -Dm755 "$srcdir/metrolist" \
    "$pkgdir/usr/bin/metrolist"
  install -Dm644 "$srcdir/metrolist.desktop" \
    "$pkgdir/usr/share/applications/metrolist.desktop"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
