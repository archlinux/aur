# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=python-sympy-docs
pkgver=1.0
pkgrel=1
pkgdesc="Documentation for Python Sympy module."
arch=('any')
url="http://www.sympy.org/"
license=('BSD')
options=('docs')
makedepends=('python-sphinx' 'librsvg' 'imagemagick')
source=("https://github.com/sympy/sympy/releases/download/sympy-$pkgver/sympy-$pkgver.tar.gz")
md5sums=('43e797de799f00f9e8fd2307dba9fab1')

build() {
	cd "sympy-$pkgver/doc"
	make html
}

package() {
	mkdir -p $pkgdir/usr/share/doc/python-sympy
	cd "sympy-$pkgver/doc/_build"
    cp -a ./html $pkgdir/usr/share/doc/python-sympy/
}
