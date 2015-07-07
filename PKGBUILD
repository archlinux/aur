# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=taskcoach
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple open source todo manager to manage personal tasks and todo lists"
arch=('any')
url="http://www.taskcoach.org"
license=('GPL3')
depends=('python2' 'wxpython2.8' 'curl' 'twisted')
changelog=taskcoach.changelog
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/TaskCoach-$pkgver.tar.gz)
md5sums=('ef131184e8d7236d80bd07080fe2b014')

build() {
	cd $srcdir/TaskCoach-$pkgver
	python2 setup.py build
}

package() {
	cd $srcdir/TaskCoach-$pkgver
	python2 setup.py install --root=$pkgdir --prefix=/usr

	install -D -m644 icons.in/taskcoach.png $pkgdir/usr/share/pixmaps/taskcoach.png
	install -D -m644 build.in/linux_common/taskcoach.desktop $pkgdir/usr/share/applications/taskcoach.desktop
}
