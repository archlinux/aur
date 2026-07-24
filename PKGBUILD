pkgname=douyin-devtools-bin
pkgver=4.5.3
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

_appimage='DouyinDevTools-4.5.3-x86_64.AppImage'
source=(
  'DouyinDevTools-4.5.3-x86_64.AppImage::https://github.com/Geequlim/-douyin-game-devtools-linux/releases/download/v4.5.3/DouyinDevTools-4.5.3-x86_64.AppImage'
  'douyin-devtools.desktop'
  'douyin-devtools.png'
)
noextract=("$_appimage")
sha256sums=(
  '107992183e9c32eeb91ba8360c01b1c31ef882655bd80a9da3b1dbbd9b1315c7'
  '7dfd49e13537bdaeb44837e70a2c83698a91628d1b0b4585a9c3a16e76e43b6e'
  '1d2045a9642f079f34a70806109cf469c6c76ca3504955e97343dd0b770e06f8'
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
