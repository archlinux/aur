# Maintainer: Jan Korte <j.korte@me.com>

pkgname=treenote-git
pkgver=20170103
pkgrel=1
pkgdesc="An intuitive outliner for personal knowledge and task management."
arch=('any')
url="http://treenote.org"
license=('GPL3')
depends=('python-pyqt5'
         'shared-mime-info'
         'desktop-file-utils')
makedepends=('git')
source=("git+https://github.com/TreeNote/TreeNote")
install="$pkgname".install
md5sums=('SKIP')

package () {
	cd $srcdir/TreeNote
	python setup.py install --root="$pkgdir"

	install -Dm644 TreeNote/resources/images/logo.png $pkgdir/usr/share/icons/scalable/apps/treenote.png

    cd ../..
	# install mime files
	install -Dm644 x-treenote-treenote.xml $pkgdir/usr/share/mime/packages/x-treenote-treenote.xml

	# install desktop file
	install -Dm644 treenote.desktop $pkgdir/usr/share/applications/treenote.desktop
}
