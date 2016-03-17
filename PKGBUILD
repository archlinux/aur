# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributer: Shanto <shanto@hotmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse-dltk-mylyn
pkgver=5.4
pkgrel=1
_pkgdate="201602110510"
pkgdesc="Mylyn support for DLTK in Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/dltk/"
license=('EPL')
depends=("eclipse-dltk-core>=$pkgver" "eclipse-mylyn")
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/dltk/downloads/drops/R${pkgver:0:3}/R-$pkgver-$_pkgdate/${pkgname#eclipse-}-R-$pkgver-$_pkgdate.zip")
md5sums=('5704a8206a5c010bdef98bb02195fd22')

package() {
	cd $srcdir || return 1
	install -dm755 $pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/ || return 1
	find -type f -exec install -Dm644 {} \
		$pkgdir/usr/lib/eclipse/dropins/${pkgname#eclipse-}/{} \; || return 1
}
