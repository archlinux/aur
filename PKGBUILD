# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski at archlinux dot org>
# Contributor: Felipe Hommen <felibank at gmail dot com>
# Contributor: moostik <mooostik at gmail dot com>

pkgname=geogebra-5
pkgver=5.0.715.0
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('any')
url='https://www.geogebra.org/'
license=('GPL3' 'CCPL:by-sa' 'CCPL:by-nc')
depends=('hicolor-icon-theme' 'java-runtime=8' 'xdg-utils')
provides=("${pkgname//-5/}")
conflicts=("${pkgname//-5/}")
source=("https://download.geogebra.org/installers/5.0/GeoGebra-Linux-Portable-${pkgver//./-}.tar.bz2"
        "https://static.geogebra.org/images/geogebra-logo.svg"
        "geogebra"
        "geogebra.desktop"
        "geogebra-mime.xml")

sha512sums=('2d7b72c0489cd457775be0ce1c05d3c44891b131531404ba6736cf7f69c7ac615900a91560edd8a6e088863d0e547387fd025ee8ea50bc391e558b7ad4409751'
            'a946acb8867f497c68ce6f8fff8172da4a43a9ca118aafcc5ac414318fd52c4bc6ada387bdfa296f0ff2e1d7411ae345b61197b4adaa3f54299aab837647df55'
            'db6db21cfcaeb6fbff412330d909a4781e640ec6fefe965b28b1b75e0ad1f2bc43d3eac588bc40925bd227e00a72a123f23b1842a77173a8411937aa929e89cf'
            '64954e749dcd8a9233a932718a4722aab5dfcde868d93998b64f79d54e51c2c34b545665f191f041455f1e945fa46b273417089981d6dff8ed8256519f7e8ae6'
            '0206240e9b1fc3a7f222a033b85e7f9fe9d3096af99c2c97ad93a2a9cb2fffc60b72baad9fbc07f0e136a5b23a7a34ee6a90820d65796757521fa0014a881626')

package() {
  cd "GeoGebra-Linux-Portable-${pkgver//./-}"

  install -Dm755 "${srcdir}/geogebra" "${pkgdir}/usr/bin/geogebra"
  install -dm755 "${pkgdir}/usr/share/geogebra"
  install "geogebra/"* -t "${pkgdir}/usr/share/geogebra/"

  install -Dm644 "${srcdir}/geogebra.desktop" "${pkgdir}/usr/share/applications/geogebra.desktop"
  install -Dm644 "${srcdir}/geogebra-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/geogebra.svg"
  install -Dm644 "${srcdir}/geogebra-mime.xml" "${pkgdir}/usr/share/mime/packages/geogebra.xml"
}
