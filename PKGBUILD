# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-python
pkgver=5.5
pkgrel=1
_pkgdate=201605241149
pkgdesc="Python IDE for Eclipse (Stable Stream)"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core" "eclipse-antlr-runtime>=3.0.0")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-R-$pkgver-$_pkgdate.zip")
md5sums=('5f940c105346139c9dfdedc0e70fc93b')

package() {
	cd $srcdir
	install -dm755 $pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/
	find . -type f -exec install -Dm644 {} \
		$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/{} \;
}
