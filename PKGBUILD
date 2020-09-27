# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-picos-git
pkgver=2.0.r12.g11f96c1
pkgrel=1
pkgdesc='A Python interface to conic optimization solvers. Git version.'
arch=('any')
url='https://gitlab.com/picos-api/picos'
license=('GPL3')
depends=('python-numpy' 'python-cvxopt')
optdepends=(
	'cplex: solve using CPLEX'
	'gurobi: solve using Gurobi'
	'mosek: solve using MOSEK'
	'python-ecos: solve using ECOS'
	'python-pyscipopt: solve using SCIP'
	'python-smcp: solve using SMCP'
	'python-swiglpk: solve using GLPK'
)
makedepends=('git' 'python-setuptools')
conflicts=('python-picos')
source=("picos::git+https://gitlab.com/picos-api/picos.git")

pkgver() {
	cd picos
	./version.py --aur
}

package() {
	cd picos
	python setup.py install --root=${pkgdir}
}

md5sums=('SKIP')
