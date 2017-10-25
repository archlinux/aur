# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=('python-swiglpk')
pkgname=('python-swiglpk' 'python2-swiglpk')
pkgdesc="A low-level Python interface to the GLPK optimization solver."
pkgver=1.4.4
pkgrel=1
arch=('any')
url='https://github.com/biosustain/swiglpk'
license=('gpl3')
makedepends=('swig')
depends=('glpk')

source=("https://github.com/biosustain/swiglpk/archive/${pkgver}.tar.gz")

package_python-swiglpk() {
	makedepends+=('python-setuptools')
	depends+=('python')

	cd "${srcdir}/swiglpk-${pkgver}"

	# Install the Python library.
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-swiglpk() {
	makedepends+=('python2-setuptools')
	depends+=('python2')

	cd "${srcdir}/swiglpk-${pkgver}"

	# Install the Python 2 library.
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('71a1693349df3f095ebe5bc713b3dd92')
