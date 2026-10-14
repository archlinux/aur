pkgname=paintdotjs-bin
pkgver=2.3.0
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
sha256sums=('361a9fe290cc19d9f47f6a2b50b7beffd1746cd3595547846cbb83214ac04913')
sha256sums_x86_64=('15b36e76e519373e818fca07d0e2ac5521491f2ad2e4de4f230425c85167c36c')

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
