# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=0xdbe
_pkgname=0xDBE
pkgver=1.0preview
_pkgver=143.1040.1
pkgrel=4
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
depends=('java-environment>=6')
source=(https://download.jetbrains.com/dbe/${pkgname}-${_pkgver}.tar.gz
        jetbrains-0xdbe.desktop)
sha256sums=('58664c47f61cdd7fd4b137d4d0b8bf24400296330e7068c9f04ed2a777333417'
            'b138f90cdeaa4dcc6cbc8cf911d65a3265938824abe64c734b1ff76e580e42c3')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_pkgname}-${_pkgver} $pkgdir/opt/${pkgname}

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
