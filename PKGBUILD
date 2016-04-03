# Maintainer: Sebba <sebba at cock dot li>
pkgname=transmission-remote-gui-bin
_pkgname=transgui
pkgver=5.3.0
pkgrel=1
pkgdesc="Cross platform remote GUI for the Transmission daemon"
arch=(x86_64)
url="https://github.com/leonsoft-kras/transmisson-remote-gui/"
license=('GPL2')
depends=(qt4pas)
provides=(transmission-remote-gui)
conflicts=(transmission-remote-gui-gtk2 transmission-remote-gui-qt4 transmission-remote-gui-svn transmission-remote-gui)
install=transmission-remote-gui.install
source=(https://github.com/leonsoft-kras/transmisson-remote-gui/releases/download/v$pkgver/$_pkgname-$pkgver-$arch-linux.zip
        ${_pkgname}.desktop)
md5sums=('f425e2e264456a08bd2464b9c9e2d97e'
         'c2db727408a17958f4b5a48f3c449f11')

package() {
  cd ${srcdir}
  install -D -m 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/lang
  install -D -m 644 lang/transgui.* ${pkgdir}/usr/share/${_pkgname}/lang
  rm ${pkgdir}/usr/share/${_pkgname}/lang/transgui.template
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 644 readme.txt history.txt LICENSE.txt ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -D -m 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
