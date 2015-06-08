# Maintainer: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Shanto <shanto@hotmail.com>

pkgname=eclipse-shelled
pkgver=2.0.3
pkgrel=2
pkgdesc="Superb shell script editor for Eclipse"
arch=('any')
url="http://shelled.sourceforge.net/"
license=('EPL')
depends=("eclipse" "eclipse-dltk-core")
optdepends=('openssh')
_mirror="http://freefr.dl.sourceforge.net"
source=("$_mirror/project/shelled/shelled/ShellEd%20${pkgver}/net.sourceforge.shelled-site-${pkgver}.zip")
md5sums=('1a675ac069c628b311b1007690ca055f')

package() {
	_dest=$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse
	cd $srcdir
	install -dm755 $_dest/
	for d in features plugins; do
		cp -R $d $_dest/
	done
}
