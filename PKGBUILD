# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=scikit-build
pkgname=python-${_name}
pkgver=0.7.1
pkgrel=1
pkgdesc='Improved build system generator for CPython C, C++, Cython and Fortran extensions'
arch=('any')
url='https://github.com/scikit-build/scikit-build'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/scikit-build/scikit-build/archive/${pkgver}.tar.gz")
md5sums=('1c918a1379f55d74d5a41bf64a1e6eec')

package() {
	cd "$srcdir/$_name-$pkgver"

	python setup.py install --optimize=1 --root=$pkgdir
    
	install -D -m644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

