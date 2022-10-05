# Maintainer: Andre Schneider <andre.schneider@outlook.at>

pkgname=protonup-qt-bin
_pkgname=ProtonUp-Qt
_iconname=net.davidotek.pupgui2.png
pkgver=2.7.4
pkgrel=1
pkgdesc="Install and manage Proton-GE for Steam and Wine-GE for Lutris with this graphical user interface."
arch=('x86_64')
url="https://davidotek.github.io/protonup-qt"
license=('GPL3')
provides=(protonup-qt)
conflicts=(protonup-qt)
options=(!strip)
source=(
  "$_pkgname-$pkgver-$CARCH.AppImage::https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH.AppImage"
  "256x256-$_iconname::https://raw.githubusercontent.com/DavidoTek/ProtonUp-Qt/main/share/icons/hicolor/256x256/apps/$_iconname"
  "128x128-$_iconname::https://raw.githubusercontent.com/DavidoTek/ProtonUp-Qt/main/share/icons/hicolor/128x128/apps/$_iconname"
  "64x64-$_iconname::https://raw.githubusercontent.com/DavidoTek/ProtonUp-Qt/main/share/icons/hicolor/64x64/apps/$_iconname"
  "protonup-qt.desktop"
  "protonup-qt"
)
sha256sums=('c8a73e28e41fa9c8aa50b9c28552dfeb2f67a6849833a166bbb9981842a6a640'
            '7b076d883121d5aa6c9575acb8afb3b725be290752cd923562db5101396c1b93'
            '8e4df1de1fd883a94e4dbe544b285f74288c8fe19a3d0b301c9953d885c7aba8'
            '3fe22cd927b21f7c40760abd82f1d64380e54c78c937286e7b27dfc7e8681c19'
            '3d2e9dbb6eb0fa034db3c1b2384fd23a8b004c90a8f72afbe86baff714433da1'
            '1baaba24e3fae798cde2f1801b9a0c5f92df5c61b0d8ba81c43731abcce44bc2')
noextract=("$_pkgname-$pkgver-$CARCH.AppImage")

package() {
  cd "$srcdir"
  
  # Install binary and launch script
  install -Dm755 "$_pkgname-$pkgver-$CARCH.AppImage" "$pkgdir/opt/protonup-qt/protonup-qt.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" protonup-qt
  
  # Install icons and desktop file
  install -Dm644 "256x256-$_iconname" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_iconname"
  install -Dm644 "128x128-$_iconname" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_iconname"
  install -Dm644 "64x64-$_iconname" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_iconname"
  install -Dm644 -t "$pkgdir/usr/share/applications" "protonup-qt.desktop"
}
