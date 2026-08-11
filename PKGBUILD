pkgname=douyin-devtools-bin
pkgver=4.5.5
pkgrel=1
pkgdesc='Douyin mini game and mini app developer tools repackaged for Linux'
arch=('x86_64')
url='https://github.com/Geequlim/-douyin-game-devtools-linux'
license=('custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'fuse2'
  'gtk3'
  'libcups'
  'libxss'
  'nss'
)
provides=('douyin-devtools')
conflicts=('douyin-devtools')
options=('!debug' '!strip')

_appimage='DouyinDevTools-4.5.5-x86_64.AppImage'
source=(
  'DouyinDevTools-4.5.5-x86_64.AppImage::https://github.com/Geequlim/-douyin-game-devtools-linux/releases/download/v4.5.5/DouyinDevTools-4.5.5-x86_64.AppImage'
  'douyin-devtools.desktop'
  'douyin-devtools.png'
)
noextract=("$_appimage")
sha256sums=(
  '7eb820a4347419fc3e383b23692a8a0b15df8954237237c43023534f579c08b5'
  '143cf85b35f3fad18663feb7596a45161d0ff4cf13292b1d113e161859f71647'
  '6dd28e298484c9026865ca76488b0682ee66a449a3156f3c70a0982fad545f51'
)

package() {
  install -Dm755 "$_appimage" \
    "$pkgdir/opt/douyin-devtools/DouyinDevTools.AppImage"
  install -Dm644 'douyin-devtools.desktop' \
    "$pkgdir/usr/share/applications/douyin-devtools.desktop"
  install -Dm644 'douyin-devtools.png' \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/douyin-devtools.png"
  install -d "$pkgdir/usr/bin"
  ln -s '/opt/douyin-devtools/DouyinDevTools.AppImage' \
    "$pkgdir/usr/bin/douyin-devtools"
}
