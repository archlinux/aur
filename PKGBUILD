# Maintainer: gigas002 <gigas002@pm.me>

pkgname=wowup-bin
_pkgname=wowup
pkgver=2.8.2
pkgrel=1
pkgdesc="WowUp the World of Warcraft addon updater"
arch=(x86_64)
url="https://github.com/WowUp/WowUp"
license=("GPL3")
depends=(
  zlib
)
provides=($_pkgname)
conflicts=($_pkgname)
options=(!strip)
source=(
  "WowUp-$pkgver.AppImage::https://github.com/WowUp/WowUp/releases/download/v$pkgver/WowUp-$pkgver.AppImage"
  "https://raw.githubusercontent.com/WowUp/WowUp/master/wowup-electron/assets/wowup_logo_512np.png"
  "https://raw.githubusercontent.com/WowUp/WowUp/master/LICENSE"
  "$_pkgname.desktop"
  "$_pkgname"
)
noextract=("WowUp-$pkgver.AppImage")
sha256sums=(
  "a028314f0303929c7a62a0817c8c164fc2227d2af6a85864850ae17370d92123"
  "1c45de78eefd65c4a7b3fc4d6cebbefdc331f854c8f26d112c441c4156f5e90b"
  "3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986"
  "2864d07fd0ce8e68b34b8b3f5170202972736918793861bd87720f080cb04ab9"
  "7e457ac9d7706d50165d58f0630f7dd578ea9cf6d3b99041af1cdde21b772bba"
)

package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "WowUp-$pkgver.AppImage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" $_pkgname

  # Install pixmap, desktop and license file
  install -Dm644 wowup_logo_512np.png "$pkgdir/usr/share/pixmaps/wowup_logo_512np.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" wowup.desktop
#   install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
