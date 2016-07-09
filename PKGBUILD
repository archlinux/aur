# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: scippio <scippio@berounet.cz>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>

pkgname=eclipse-pdt
pkgver=4.0.0
_reltag=201606081033
pkgrel=1
pkgdesc="PHP Development Tools for Eclipse"
arch=('any')
url="http://www.eclipse.org/pdt/"
license=('EPL')
depends=('eclipse-dltk-core' 'eclipse-dtp' 'eclipse-wtp')
optdepends=('eclipse-rse: For remote projects' 'php: The interpreter' 'xdebug: Better debug experience')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/tools/pdt/downloads/pdt-Update-${pkgver}.${_reltag}.zip")

sha256sums=('346687b6672e71c3a9cf4c16ba05815098820f33b4fff796f847689808d94d35')

package() {
  _dest="$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/"
  
  cd "$srcdir/${pkgver%.*}"
  mkdir -p "${_dest}"
  
  cp -r {features,plugins} "$_dest/"

  find "$pkgdir/usr/lib/eclipse" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/lib/eclipse" -type f -exec chmod 644 {} \;
}
