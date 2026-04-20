# Maintainer: aquaticcalf
pkgname=spirit
pkgver=0.0.0
pkgrel=3
pkgdesc="spirit (prebuilt tarball)"
arch=('x86_64')
url="https://github.com/aquaticcalf/spirit"
license=('MIT')
source=("spirit-0.0.0-x64.tar.gz::https://github.com/aquaticcalf/spirit/releases/download/0.0.0/spirit-0.0.0-x64.tar.gz" "icon.png::https://github.com/aquaticcalf/spirit/releases/download/0.0.0/icon.png")
sha256sums=('48eb2fc4379d32913a32410faaae0e91118d5bb1a396c2f5517ce9d117b53ad3' 'SKIP')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  tar -xzf "${srcdir}/${ASSET_NAME}" -C "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/spirit" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<DESKTOP
[Desktop Entry]
Name=spirit
Comment=spirit desktop
Exec=/opt/${pkgname}/spirit
Icon=${pkgname}
Type=Application
Categories=Programming;
DESKTOP
}
