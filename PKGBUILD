# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openstreetmap
_pkgname=osmembrane
pkgname=${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc='OSMembrane is a frontend to the Osmosis data processing tool'
arch=(any)
url="http://osmembrane.de"
license=('GPL3')
depends=('java-runtime')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/releases/download/v${pkgver}/OSMembrane.jar")
sha256sums=('3886886bb056cec3fe9a6c838354ff196363f03f6f14a14d88ffb1ae5d5b9b70')

package() {
  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share
  install -d 755 ${pkgdir}/usr/share/java
  install -d 755 ${pkgdir}/usr/share/java/${pkgname}

  install -m 755 ${srcdir}/../${pkgname} ${pkgdir}/usr/bin
  install -m 644 ${srcdir}/../OSMembrane.jar ${pkgdir}/usr/share/java/${pkgname}
}
