# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=scikit-build
pkgname=python-${_name}
pkgver=0.6.1
pkgrel=1
pkgdesc='Improved build system generator for CPython C, C++, Cython and Fortran extensions'
arch=('any')
url='https://github.com/scikit-build/scikit-build'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/scikit-build/scikit-build/archive/${pkgver}.tar.gz")
md5sums=('f5b79109e4314ff6bb02a20c38a3c817')

package() {
	cd "$srcdir/$_name-$pkgver"

	python setup.py install --optimize=1 --root=$pkgdir
    
	install -D -m644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

