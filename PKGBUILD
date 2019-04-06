# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=scikit-build
pkgname=python-${_name}
pkgver=0.9.0
pkgrel=1
pkgdesc='Improved build system generator for CPython C, C++, Cython and Fortran extensions'
arch=('any')
url='https://github.com/scikit-build/scikit-build'
license=('MIT')
depends=('python-setuptools' 'python-wheel')
makedepends=()
source=("https://github.com/scikit-build/scikit-build/archive/${pkgver}.tar.gz")
sha256sums=('b7ac5a574ca5a4b0891aeaf5b0340de9fdc88d0081669dca494cef5b9fa760b0')

package() {
	cd "$srcdir/$_name-$pkgver"

	python setup.py install --optimize=1 --root=$pkgdir

	install -D -m644 ${srcdir}/$_name-$pkgver/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

