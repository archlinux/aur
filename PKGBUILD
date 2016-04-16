# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
pkgname=('python-pydbus-git'
         'python2-pydbus-git')
pkgver=0.5.1.r0.1b58124
pkgrel=1
pkgdesc="Pythonic DBus library"
arch=("any")
url="https://github.com/LEW21/pydbus"
license=('LGPL')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=('pydbus::git+https://github.com/LEW21/pydbus.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pydbus"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//')"
}

package_python-pydbus-git() {
	depends=('python' 'python-gobject')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	cd "$srcdir/pydbus"
	python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pydbus-git() {
	depends=('python2' 'python2-gobject')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	cd "$srcdir/pydbus"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
