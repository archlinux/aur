# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=eclipse-pydev
pkgver=4.1.0
pkgrel=1
pkgdesc="Python IDE for Eclipse"
url="http://pydev.org/"
arch=('any')
license=('EPL')
depends=('java-environment>=7' 'eclipse>=3.8')
makedepends=('unzip')
conflicts=('eclipse-aptana')
optdepends=('eclipse-pydev-mylyn: Mylyn support for Pydev in Eclipse')
source=("PyDev_${pkgver}.zip::http://downloads.sourceforge.net/project/pydev/pydev/PyDev%20${pkgver}/PyDev%20${pkgver}.zip")
md5sums=('bab2783b33a5f9735fab482c583d8e27')

package () {

  _dest="${pkgdir}/usr/share/eclipse/dropins/pydev/eclipse"
  
  cd "$srcdir"
  mkdir -p "${_dest}"
  
  cp -r {features,plugins} "$_dest/"

  find "$pkgdir/usr/share/eclipse" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/eclipse" -type f -exec chmod 644 {} \;

}
