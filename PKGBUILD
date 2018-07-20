# Maintainer: LinArcx <linarcx@gmail.com>

pkgname='qt-online-installer'
_pkgname='qt-online-installer'
pkgver=3.0
_pkgverminor=3.0.5
pkgrel=1
pkgdesc="Qt Online Installer for the optimal Qt installation experience."
arch=('x86_64')
url="https://www.qt.io/download"
license=('GPL-3.0')
source=("http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run"
        "qt-online-installer.desktop"
        "qt-online-installer.svg") 
#"/mnt/D/Document/WorkSpace/Packages/AUR/qt-online-installer/sources.tar.gz"  #"http://ftp.jaist.ac.jp/pub/qtproject/archive/online_installers/${pkgver}/qt-unified-linux-x64-$_pkgverminor-online.run")
# source_i686=("http://ftp.jaist.ac.jp/pub/qtproject/archive/online_installers/${pkgver}/qt-unified-linux-x32-$_pkgverminor-online.run")
sha256sums=('SKIP')
# sha256sums_i686=('SKIP')

package() {
  cd $srcdir

  _pkg=linux-x64
  if [ "${CARCH}" = "i686" ]; then
    _pkg=linux-x32
  fi

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons" 

#   cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${_pkgname}" -R
#   cp $srcdir/QEELauncher.sh ${pkgdir}/opt/${_pkgname}
#   cp $srcdir/${pkgname}.svg ${pkgdir}/usr/share/icons/${pkgname}
#   cp $srcdir/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}

  # ln -s /opt/${pkgname}/MyQxEntityEditorLauncher.sh "${pkgdir}"/usr/bin/MyQxEntityEditorLauncher.sh
  install -Dm644 ${srcdir}/qt-unified-linux-x64-online.run ${pkgdir}/usr/bin/qt-unified-linux-x64-online.run
  install -Dm755 ${srcdir}/${pkgname}.svg ${pkgdir}/usr/share/icons/${pkgname}.svg
  install -Dm755 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  chmod +x ${pkgdir}/usr/bin/qt-unified-linux-x64-online.run
}