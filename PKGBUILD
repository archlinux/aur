# Maintainer: masutu Subric <masutu dot arch at gmail dot com>
# Contributor: Michal Marek <reqamst at gmail dot com>

pkgname=python2-pyephem
pkgver=3.7.5.3
pkgrel=1
pkgdesc="PyEphem provides scientific-grade astronomical computations"
arch=('i686' 'x86_64')
url="http://rhodesmill.org/pyephem/"
license=('GPL' 'LGPL')
depends=('python2')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/pyephem/pyephem-$pkgver.tar.gz)
md5sums=('46b101da152bb109b1137263b150f390')

package() {
	cd "$srcdir/pyephem-$pkgver"
	for file in $(find  ephem/tests/ -name '*.py' -print); do
		sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
	done
	python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
