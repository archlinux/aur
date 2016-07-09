# Maintainer: Shanto <shanto@hotmail.com>
# Maintainer: Jonathan Wiersma <archaur at jonw dot org>
pkgname=eclipse-dtp
pkgver=1.13.0
pkgrel=1
_pkgdate=201603142002
pkgdesc="Data Tools Platform for Eclipse"
arch=('any')
url="http://www.eclipse.org/datatools/"
license=('EPL')
depends=( 'eclipse' 'eclipse-emf' 'eclipse-gef' )
options=('!strip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/datatools/updates/${pkgver%.*}/${pkgver}.${_pkgdate}/dtp-repository-${pkgver}.${_pkgdate}.zip")
md5sums=('a23e96f0afb606da58fa01a5695ea9e6')

package() {
  _dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/"
  
  cd "$srcdir"
  mkdir -p "${_dest}"
  
  cp -r {features,plugins} "$_dest/"

  find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
