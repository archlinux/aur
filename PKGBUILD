# Maintainer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-itcl
pkgver=4.0
pkgrel=1
_pkgdate=201206120903
pkgdesc="incr Tcl IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-tcl")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-R-$pkgver-$_pkgdate.zip")
md5sums=('714bb8ae5bfa3f16e3257f552dd80e26')

package() {
	cd $srcdir
	install -dm755 $pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/
	find -type f -exec install -Dm644 {} \
		$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/{} \;
}
