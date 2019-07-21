# Maintainer: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Peter Simons <simons@cryp.to>

pkgbase=pyutil
pkgname=('python2-pyutil' 'python-pyutil')
pkgver=3.3.0
pkgrel=1
pkgdesc="general-purpose python library (used by tahoe-lafs)"
arch=('any')
url='https://pypi.python.org/pypi/pyutil'
license=('GPL2')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pyutil/pyutil-${pkgver}.tar.gz")
sha256sums=('8c4d4bf668c559186389bb9bce99e4b1b871c09ba252a756ccaacd2b8f401848')

package_python2-pyutil() {
	depends=('python2-simplejson' 'python2-zbase32')
	replaces=('pyutil')
	conflicts=('python-pyutil')
	cd "$srcdir/pyutil-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
    rm -r "$pkgdir/usr/pyutil"
}

package_python-pyutil() {
	depends=('python-simplejson' 'python-zbase32')
	conflicts=('python2-pyutil')
	cd "$srcdir/pyutil-$pkgver"
    python setup.py install --root="$pkgdir" --prefix='/usr' --optimize=1
    rm -r "$pkgdir/usr/pyutil"
}
