# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=('python-smcp')
pkgname=('python-smcp' 'python2-smcp')
pkgdesc="A Python solver for sparse matrix cone programs."
pkgver=0.4.5
pkgrel=1
arch=('any')
url='http://smcp.readthedocs.io'
license=('gpl3')

source=("https://github.com/cvxopt/smcp/archive/v${pkgver}.tar.gz")

package_python-smcp() {
	makedepends+=('python-setuptools')
	depends+=('python-cvxopt' 'python-chompack')

	cd "${srcdir}/smcp-${pkgver}"

	# Install the Python library.
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-smcp() {
	makedepends+=('python2-setuptools')
	depends+=('python2-cvxopt' 'python-chompack')

	cd "${srcdir}/smcp-${pkgver}"

	# Install the Python 2 library.
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('381ff82f6f45eacc62ff11858e68631a')
