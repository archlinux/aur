# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-pydev
pkgver=5.1.2
pkgrel=1
pkgdesc="Python IDE for Eclipse"
url="http://pydev.org/"
arch=('any')
license=('EPL')
depends=('java-environment>=8' 'eclipse>=4.5')
makedepends=('unzip')
conflicts=('eclipse-aptana')
source=("PyDev_${pkgver}.zip::http://downloads.sourceforge.net/project/pydev/pydev/PyDev%20${pkgver}/PyDev%20${pkgver}.zip")
md5sums=('0aba0bea1c6d6ebc0501b0cc9223a5e1')

package () {

  _dest="${pkgdir}/usr/lib/eclipse/dropins/pydev/eclipse"
  
  cd "$srcdir"
  mkdir -p "${_dest}"
  
  cp -r {features,plugins} "$_dest/"

  find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
