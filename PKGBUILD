# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=0xdbe
_pkgname=0xDBE
pkgver=1.0preview
_pkgver=143.324.5
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
depends=('java-environment>=6')
source=(https://download.jetbrains.com/dbe/${pkgname}-${_pkgver}.tar.gz
        jetbrains-0xdbe.desktop)
sha256sums=('e0cedb4809c6d10309d8c5ce6384fbdee2ae3a223ee603ce4d228d31f7850fbd'
            'ce2afc4b029f94cb6c80f7f7da4d1b9cd800967d9f47656914fcc19eec89fd38')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_pkgname}-${_pkgver} $pkgdir/opt/${pkgname}

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/0xdbe.png" "${pkgdir}/usr/share/pixmaps/0xdbe.png"
}
