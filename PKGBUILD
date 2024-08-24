# Maintainer: gigas002 <gigas002@pm.me>

pkgname=wowup-bin
_pkgname=wowup
pkgver=2.20.0
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
sha256sums=('a039662ffd4dfba438cc11312e59c82cbe0b4a8cfe685dad480ff1f96a6c6780'
            '1c45de78eefd65c4a7b3fc4d6cebbefdc331f854c8f26d112c441c4156f5e90b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '707ed545b36db612dac379417d6d1cc1813cdbd110071e206da5414bba1b405f'
            '7e457ac9d7706d50165d58f0630f7dd578ea9cf6d3b99041af1cdde21b772bba')

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
