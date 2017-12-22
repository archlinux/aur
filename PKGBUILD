# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Sebba <sebba at cock dot li>
pkgname=transmission-remote-gui-bin
_pkgname=transgui
pkgver=5.13.0
_pkgver=5.13.0
pkgrel=1
pkgdesc="Cross platform remote GUI for the Transmission daemon"
arch=(x86_64)
url="https://github.com/leonsoft-kras/transmisson-remote-gui/"
license=('GPL2')
depends=('gtk2' 'desktop-file-utils')
provides=(transmission-remote-gui)
conflicts=(transmission-remote-gui-gtk2 transmission-remote-gui-qt4 transmission-remote-gui-svn transmission-remote-gui)
source=(https://github.com/leonsoft-kras/transmisson-remote-gui/releases/download/v$_pkgver/$_pkgname-$pkgver-$arch-linux.txz
        ${_pkgname}.desktop)
sha256sums=('dac4b726726cfef720ba0f42878ccc920125df228ad04e339c5640b469dff8be'
            '2ba5d396699c2f0267a8f64f03ccb8e076552b3f8a5ba0a91899b9d246e6a87d')

package() {
  cd ${srcdir}
  install -D -m 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}/lang
  install -D -m 644 lang/transgui.* ${pkgdir}/usr/share/${_pkgname}/lang
  rm ${pkgdir}/usr/share/${_pkgname}/lang/transgui.template
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 644 README.md history.txt LICENSE ${pkgdir}/usr/share/doc/${_pkgname}
  install -D -m 644 ${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -D -m 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
