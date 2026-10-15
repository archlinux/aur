pkgname=paintdotjs-bin
pkgver=2.4.2
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
sha256sums=('4374a71164e2b293c2887533ceb473dcfaf18489990359bb5c3d96b728e01ba3')
sha256sums_x86_64=('f095432500cbe33dc71392d05de0c2d067bb8b6998af2925cdd96b4b174ce49e')

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
