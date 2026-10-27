pkgname=paintdotjs-bin
pkgver=2.4.6
pkgrel=1
pkgdesc='An open source general-purpose raster graphics editor program.'
arch=('x86_64')
url='https://paintjs.net/'
license=('MIT')
depends=('fuse2' 'gtk3' 'nss')
provides=('paintdotjs')
conflicts=('paintdotjs')
options=('!strip')
source=(
  "paintdotjs-${pkgver}-source.tar.gz::https://github.com/LabyStudio/paintdotjs/archive/refs/tags/v${pkgver}.tar.gz"
)
source_x86_64=("paintdotjs-${pkgver}.AppImage::https://github.com/LabyStudio/paintdotjs/releases/download/v${pkgver}/paintdotjs-${pkgver}-linux-x86_64.AppImage")
noextract=("paintdotjs-${pkgver}.AppImage")
sha256sums=('44df4515a3cc2bf9643014f37517e9f1ce6d2c5dcc57aa5625a2d437fad5ce4c')
sha256sums_x86_64=('1d219c18563d64e1aa02e113241971be3ab77e9edd97dfbb6fc06431e94cb1f6')

package() {
  local project="paintdotjs-${pkgver}"
  install -Dm755 "paintdotjs-${pkgver}.AppImage" "$pkgdir/opt/paintdotjs/paintdotjs.AppImage"

  install -Dm755 "$project/aur/paintdotjs" "$pkgdir/usr/bin/paintdotjs"
  install -Dm644 "$project/aur/paintdotjs.desktop" "$pkgdir/usr/share/applications/paintdotjs.desktop"
  install -Dm644 "$project/aur/x-paintdotnet.xml" "$pkgdir/usr/share/mime/packages/x-paintdotnet.xml"
  install -Dm644 "$project/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/paintdotjs.png"
  install -Dm644 "$project/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/mimetypes/application-x-paintdotnet.png"
  install -Dm644 "$project/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
