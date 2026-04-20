# Maintainer: aquaticcalf
pkgname=spirit
pkgver=0.0.0
pkgrel=2
pkgdesc="spirit (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/aquaticcalf/spirit"
license=('MIT')
depends=('fuse2')
source=("spirit-0.0.0-x86_64.AppImage::https://github.com/aquaticcalf/spirit/releases/download/0.0.0/spirit-0.0.0-x86_64.AppImage" "icon.png::https://github.com/aquaticcalf/spirit/releases/download/0.0.0/icon.png")
sha256sums=('c92e63b7fa4965a59e7ce42021493b758df189f2c92c159d1fdf0ad394452b02' 'SKIP')

package() {
  install -Dm755 "${srcdir}/spirit-0.0.0-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<DESKTOP
[Desktop Entry]
Name=spirit
Comment=spirit desktop
Exec=/opt/${pkgname}/${pkgname}.AppImage
Icon=${pkgname}
Type=Application
Categories=Programming;
DESKTOP
}
