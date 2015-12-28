# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=datagrip
_pkgname=DataGrip
pkgver=1.0.1
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
depends=('java-environment>=6')
provides=('0xdbe' '0xdbe-eap')
conflicts=('0xdbe' '0xdbe-eap')
source=(https://download.jetbrains.com/$pkgname/${pkgname}-${pkgver}-custom-jdk-linux.tar.gz
        jetbrains-datagrip.desktop)
sha256sums=('ab46a915523321e447547770e4f21e845ecb23b74aec803fafdd8177f332fc1c'
            '60624032f3952952e31d0ccd0eec9c602b6612ad204b5d6ee0f35152a4e219eb')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/

  cp -a ${srcdir}/${_pkgname}-${pkgver} $pkgdir/opt/${pkgname}

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/product.png" "${pkgdir}/usr/share/pixmaps/product.png"
}
