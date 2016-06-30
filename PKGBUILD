# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-core-index
pkgver=5.5
pkgrel=1
_pkgdate=201605241149
pkgdesc="Support for H2 index in Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core" "eclipse-h2-database>=1.1.117")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-R-$pkgver-$_pkgdate.zip")
md5sums=('20ff9f9360d72995b25acecfd736fffd')

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/"
	find . -type f -exec install -Dm644 {} \
		"$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/{}" \;
}
