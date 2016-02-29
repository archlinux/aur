# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
pkgname=('python-pydbus-git'
         'python2-pydbus-git')
pkgver=v0.3.r0.b665d73
pkgrel=1
pkgdesc="Pythonic DBus library"
arch=("any")
url="https://github.com/LEW21/pydbus"
license=('LGPL')
groups=()
makedepends=('git' 'python-setuptools' 'python2-setuptools')
replaces=()
backup=()
options=()
install=
source=('pydbus::git+https://github.com/LEW21/pydbus.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pydbus"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
