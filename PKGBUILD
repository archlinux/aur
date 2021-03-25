# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>
_projectname='markupsafe'
pkgname="python2-$_projectname"
pkgver='1.1.1'
pkgrel='8'
pkgdesc='Implements a XML/HTML/XHTML Markup safe string for Python - python2 version'
arch=('x86_64')
url='https://pypi.python.org/pypi/MarkupSafe'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/pallets/$_projectname/archive/$pkgver.tar.gz")
sha256sums=('222a10e3237d92a9cd45ed5ea882626bc72bc5e0264d3ed0f2c9129fa69fc167')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 'LICENSE.rst' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
