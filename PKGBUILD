# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=taskcoach
pkgver=1.4.3
pkgrel=2
pkgdesc="A simple open source todo manager to manage personal tasks and todo lists"
arch=('any')
url="http://www.taskcoach.org"
license=('GPL3')
depends=('python2' 'wxpython2.8' 'curl' 'python2-twisted' 'libxss')
changelog=taskcoach.changelog
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/TaskCoach-$pkgver.tar.gz")
sha256sums=('a2885ffefc0d5b55a0cbe47ad1a2d57cde52595cbba786ebf661bd2435071a2b')

build() {
	cd "$srcdir"/TaskCoach-$pkgver
	python2 setup.py build
}

package() {
	cd "$srcdir"/TaskCoach-$pkgver
	python2 setup.py install --root="$pkgdir" --skip-build

	install -D -m644 icons.in/taskcoach.png "$pkgdir"/usr/share/pixmaps/taskcoach.png
	install -D -m644 build.in/linux_common/taskcoach.desktop "$pkgdir"/usr/share/applications/taskcoach.desktop
}
