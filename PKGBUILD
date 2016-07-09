# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>
pkgname=eclipse-jdt
pkgver=4.6
pkgdate=201606061100
pkgrel=1
pkgdesc="Java Development Tools - Separated from Eclipse SDK package. Use with eclipse-platform"
url="http://www.eclipse.org/jdt/"
arch=('any')
license=('EPL')
depends=('eclipse-platform')
makedepends=('unzip')
options=(!strip)
_mirror="http://www.eclipse.org/downloads/download.php?mirror_id=1&file="
source=("${_mirror}/eclipse/downloads/drops4/R-${pkgver}-${pkgdate}/org.eclipse.jdt-${pkgver}.zip")
md5sums=('6897e5081a02eb75f345a5cc0bead4a1')

package() {
  _dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/"
  
  cd "$srcdir"
  mkdir -p "${_dest}"
  
  cp -r {features,plugins} "$_dest/"

  find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
