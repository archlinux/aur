# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-javascript
pkgver=5.0
pkgrel=1
_pkgdate=201306060709
pkgdesc="Javascript IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=( "eclipse-dltk-core" "eclipse-antlr-runtime>=3.0.0")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-I-$_pkgdate.zip")
md5sums=('6721a5c09648ca47068507b60819de29')

package() {
	cd $srcdir
	install -dm755 $pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/
	find . -type f -exec install -Dm644 {} \
		$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/{} \;
}
