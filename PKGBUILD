# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-pyscipopt-git
pkgver=3.0.1.r1.g61eb1dd
pkgrel=1
pkgdesc='A Python Interface to the SCIP Optimization Suite. Git version.'
arch=('any')
url='http://scip.zib.de'
license=('MIT')
depends=('python' 'scipoptsuite')
makedepends=('cython' 'python-setuptools')
conflicts=('python-pyscipopt')
source=("${pkgname}::git+https://github.com/SCIP-Interfaces/PySCIPOpt.git")

pkgver() {
	cd "${srcdir}/${pkgbase}"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${pkgbase}"
	python setup.py install --root=${pkgdir} --optimize=1
}

md5sums=('SKIP')
