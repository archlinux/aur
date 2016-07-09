# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jesus Jerez <jerezmoreno@gmail.com>

pkgname=eclipse-pde
pkgver=4.6
_pkgdate=201606061100
pkgrel=1
pkgdesc="Plug-in Development Environment - Separated from Eclipse SDK package. Use with eclipse-platform"
url="http://www.eclipse.org/pde/"
arch=('any')
license=('EPL')
depends=('eclipse>=4.5')
makedepends=('unzip')
options=(!strip)
_mirror="http://www.eclipse.org/downloads/download.php?mirror_id=1&file="
source=(${_mirror}"/eclipse/downloads/drops4/R-${pkgver}-${_pkgdate}/org.eclipse.pde-${pkgver}.zip")
md5sums=('041eb743921b659b2e7e13908334f238')

# find new versions in http://download.eclipse.org/eclipse/downloads/drops4/R-4.6-201606061100/

package() {
  _dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/"
  
  cd "$srcdir"
  mkdir -p "${_dest}"
  
  cp -r {features,plugins} "$_dest/"

  find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
