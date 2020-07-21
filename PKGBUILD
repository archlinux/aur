# Maintainer: Barfin
pkgname=poweriso-gui
pkgver=1.1
pkgrel=3
pkgdesc="free GUI program which runs on Linux. It can create, extract, edit, convert all popular image files (including ISO, BIN, DAA, NRG, and etc). It can also burn image files to compact disc or copy compact discs to image files"
arch=('i686' 'x86_64')
url="ٰhttp://www.poweriso.com/download-poweriso-for-linux.htm"
license=('Freeware')
depends=("freetype2" "hicolor-icon-theme" "libbsd" "qt5-base")
md5sums=('SKIP'
         '7d6691d03b3f30f9776935c412d8c18c'
         '791bb24e8a2db258af3a538a5e2119b2'
         '62614ce35baa789ecb3ca6f0dd02b695')
if [ "${CARCH}" = "i686" ]; then
    source=("http://www.poweriso.com/poweriso-x86-${pkgver}.tar.gz"
    "poweriso-gui.desktop"
    "poweriso-gui.svg"
    "poweriso.sh")
else
    source=("http://www.poweriso.com/poweriso-x64-${pkgver}.tar.gz"
    "poweriso-gui.desktop"
    "poweriso-gui.svg"
    "poweriso.sh")
fi
package() {
  mkdir -p "${pkgdir}/usr/share/poweriso-gui"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable"
  mkdir -p "${pkgdir}/usr/bin"
  cp ${srcdir}/poweriso-*/* "${pkgdir}/usr/share/poweriso-gui"
  rm -f "${pkgdir}/usr/share/poweriso-gui/poweriso.sh"
  install -Dm755 "${srcdir}/poweriso.sh" "${pkgdir}/usr/bin/poweriso-gui"
  install -Dm644 "${srcdir}/poweriso-gui.desktop" "${pkgdir}/usr/share/applications/poweriso-gui.desktop"
  install -Dm644 "${srcdir}/poweriso-gui.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/poweriso-gui.svg"
}
