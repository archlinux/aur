pkgname=douyin-devtools-bin
pkgver=4.5.6
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

_appimage='DouyinDevTools-4.5.6-x86_64.AppImage'
source=(
  'DouyinDevTools-4.5.6-x86_64.AppImage::https://github.com/Geequlim/-douyin-game-devtools-linux/releases/download/v4.5.6/DouyinDevTools-4.5.6-x86_64.AppImage'
  'douyin-devtools.desktop'
  'douyin-devtools.png'
)
noextract=("$_appimage")
sha256sums=(
  'a10aa4a9f1c1bab44f486738d422d5216f9bdb6e63cfa8815a9dd42d10904aff'
  'bddb7e63ffff50f2b86303e46c6a17bb5c5f8338ab506dbf3f24ea35e7b9cf8f'
  'be43d6bb0dc687b839d89118aa1425e45fe0909e382f4e5be6f443c90fe64a27'
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
