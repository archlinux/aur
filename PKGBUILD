# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=taskcoach
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple open source todo manager to manage personal tasks and todo lists"
arch=('any')
url="http://www.taskcoach.org"
license=('GPL3')
depends=('python2' 'wxpython2.8' 'curl' 'twisted' 'libxss')
changelog=taskcoach.changelog
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/TaskCoach-$pkgver.tar.gz)
md5sums=('10c145061ea72b9ecbb9e276cc3ef10c')

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
