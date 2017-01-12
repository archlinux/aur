# Contributer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=eclipse-dltk-shelled
pkgver=5.6
pkgrel=1
_pkgdate="201608300412"
pkgdesc="Shell IDE for Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core")
optdepends=('openssh')
conflicts=("eclipse-shelled")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/dltk-sh-R-$pkgver-$_pkgdate.zip")
md5sums=('ea4cd904f6ad607d77aff96fa810b4d4')

package() {
	cd $srcdir
	install -dm755 $pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/
	find . -type f -exec install -Dm644 {} \
		$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/{} \;
}
