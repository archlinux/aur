# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-core-index
pkgver=3.0.1
pkgrel=1
_pkgdate=201108261011
pkgdesc="Support for H2 index in Eclipse (Stable Stream)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core" "eclipse-h2-database>=1.1.117")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/S-$pkgver-$_pkgdate/${pkgname#eclipse-}-S-$pkgver-$_pkgdate.zip")
md5sums=('6ea878829f369277fdbe2ddd597642df')

package() {
	cd $srcdir
	install -dm755 $pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/
	find eclipse -type f -exec install -Dm644 {} \
		$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/{} \;
}
