# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=qgroundcontrol
pkgver=2.9.6
pkgrel=1
pkgdesc="Micro air vehicle ground control station."
arch=('any')
url="http://qgroundcontrol.org/"
license=('GPL3')
conflicts=('qgroundcontrol-git')
depends=(\
  'espeak'  # optional but you have to decide if you want it at built-time\
  'qt5-svg' 'qt5-graphicaleffects' 'qt5-webkit' 'phonon-qt4' 'qt5-serialport'\
  'qt5-quickcontrols')

source=('https://github.com/mavlink/qgroundcontrol/releases/download/v2.9.6/qgroundcontrol.tar.bz2')
md5sums=('1914137f3206218ce39bd0e208d2b674')

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -R "$srcdir/${pkgname}" "${pkgdir}/opt/qgroundcontrol"
  cat <<EndOfFile > "${pkgdir}/usr/bin/qgroundcontrol"
#!/bin/bash
cd /opt/qgroundcontrol/
exec ./qgroundcontrol $*
EndOfFile
  chmod +x "${pkgdir}/usr/bin/qgroundcontrol"
}

# vim:set ts=2 sw=2 et:
