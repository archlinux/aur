# Maintainer: Sebba <sebba at cock dot li>
pkgname=transmission-remote-gui-bin
_pkgname=transgui
pkgver=5.4.0
pkgrel=2
pkgdesc="Cross platform remote GUI for the Transmission daemon"
arch=(x86_64)
url="https://github.com/leonsoft-kras/transmisson-remote-gui/"
license=('GPL2')
depends=(qt4pas)
provides=(transmission-remote-gui)
conflicts=(transmission-remote-gui-gtk2 transmission-remote-gui-qt4 transmission-remote-gui-svn transmission-remote-gui)
source=(https://github.com/leonsoft-kras/transmisson-remote-gui/releases/download/v$pkgver/$_pkgname-$pkgver-$arch-linux.zip
        ${_pkgname}.desktop)
md5sums=('98d80d0ef7d4f8460cc890dcc6bd9ff3'
         'c8d5f3b951261ef8568291007f976a0a')

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
