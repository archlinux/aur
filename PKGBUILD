# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgbase=python-pyscipopt-git
pkgname=('python-pyscipopt-git' 'python2-pyscipopt-git')
pkgver=3.0.0.r10.g9c7c229
pkgrel=1
pkgdesc='A Python Interface to the SCIP Optimization Suite.'
arch=('any')
url='http://scip.zib.de'
license=('MIT')
depends=('scipoptsuite')
conflicts=('python-pyscipopt' 'python2-pyscipopt')
#provides=('python-pyscipopt' 'python2-pyscipopt') # Not working with conflicts.
makedepends=('cython' 'python-setuptools' 'python2-setuptools')
source=("${pkgbase}::git+https://github.com/SCIP-Interfaces/PySCIPOpt.git")

pkgver() {
	cd "${srcdir}/${pkgbase}"

	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package_python-pyscipopt-git() {
	depends+=('python')

	cd "${srcdir}/${pkgbase}"

	python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pyscipopt-git() {
	depends+=('python2')

	cd "${srcdir}/${pkgbase}"

	python2 setup.py install --root=${pkgdir} --optimize=1
}

md5sums=('SKIP')
