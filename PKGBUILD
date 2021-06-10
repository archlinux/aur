# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>
# Contributor: Erhan SAHIN <erhan@ssahin.net>
_projectname='fasteners'
pkgname="python2-$_projectname"
pkgver='0.16.2'
pkgrel='1'
pkgdesc='A python package that provides useful locks - python2 version'
arch=('any')
url="https://github.com/harlowja/$_projectname"
license=('Apache')
depends=('python2' 'python2-monotonic>=0.1' 'python2-six')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4f1d60528fe43a3ed4da239ab1ea1d0d87ad6506d9ea54cee3adcda9872c9377')

_sourcedirectory="$_projectname-$pkgver"

prepare() {
	sed -i 's|#!/usr/bin/env python$|#!/usr/bin/env python2.7|g' "$srcdir/$_sourcedirectory/setup.py"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
