# Maintainer: rsteube <rsteube@users.noreply.github.com>
_pkgname=alva
pkgname=alva-appimage
pkgver=0.8.0
pkgrel=1
pkgdesc="Create living prototypes with code components."
arch=("i686" "x86_64")
url="https://meetalva.io"
license=('MIT')
provides=(alva)
conflicts=(alva)
options=(!strip)
source=("https://github.com/meetalva/alva/releases/download/v${pkgver}/Alva-${pkgver}.AppImage"
        "alva.sh")
md5sums=(abad794dd58818065a1f9133e7aef566
         SKIP)

package() {
  sed -i "s/\${pkgver}/${pkgver}/" "${srcdir}/alva.sh"

  install -D -m 755  "${srcdir}/Alva-${pkgver}.AppImage" "${pkgdir}/opt/appimages/Alva-${pkgver}.AppImage"
  install -D -m 755  "${srcdir}/alva.sh" "${pkgdir}/usr/bin/alva"
}
