# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

_pkg=TaskCoach
pkgname=taskcoach
pkgver=1.4.6
pkgrel=1
pkgdesc="Todo manager to keep track of personal tasks, todo lists, with effort tracking, categories, notes and more."
arch=('any')
url="http://www.taskcoach.org"
license=('GPL3')
depends=('python2' 'python2-wxpython3' 'curl' 'python2-twisted' 'libxss')
changelog=$pkgname.changelog
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$_pkg-$pkgver.tar.gz")
sha256sums=('2ef47fbc65165f8de10a519d07175ae6ec226c5906c8c2569448ac1363495f98')

build() {
	cd "$srcdir"/$_pkg-$pkgver
	python2 setup.py build
}

package() {
	cd "$srcdir"/$_pkg-$pkgver
	python2 setup.py install --root="$pkgdir" --skip-build

	install -D -m644 icons.in/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -D -m644 build.in/linux_common/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
