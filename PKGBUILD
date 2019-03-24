# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Eli Schwartz <eschwartz at archlinux dot org>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

_pkg=TaskCoach
pkgname=taskcoach
pkgver=1.4.5
pkgrel=1
pkgdesc="Todo manager to keep track of personal tasks, todo lists, with effort tracking, categories, notes and more."
arch=('any')
url="http://www.taskcoach.org"
license=('GPL3')
depends=('python2' 'python2-wxpython3' 'curl' 'python2-twisted' 'libxss')
changelog=$pkgname.changelog
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$_pkg-$pkgver.tar.gz")
sha256sums=('8ca3e026d9ee1a5f343b67fc8f75ba71945ce8f112706dd2bc661a9be4c81db0')

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
