# Maintainer: Barfin
pkgname=poweriso-gui
pkgver=1.1
pkgrel=1
pkgdesc="free GUI program which runs on Linux. It can create, extract, edit, convert all popular image files (including ISO, BIN, DAA, NRG, and etc). It can also burn image files to compact disc or copy compact discs to image files"
arch=("any")
url="ٰhttp://www.poweriso.com/download-poweriso-for-linux.htm"
license=('Freeware')
md5sums=('SKIP'
         '63ff3621b7f79372f41de43218908063'
         '791bb24e8a2db258af3a538a5e2119b2'
         'ef4fd8334463276e378822e9182d6da3')
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
