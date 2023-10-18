# Maintainer: Paul Irofti <paul@irofti.net>
_name=Pyomo
pkgname="python-${_name,,}"
pkgver=6.6.2
pkgrel=1

pkgdesc="Pyomo: Python Optimization Modeling Objects"
url="https://github.com/Pyomo/pyomo"
arch=('any')
license=('BSD')

depends=(python python-numpy python-scipy python-sympy
  python-networkx python-openpyxl python-pyodbc python-pyutilib python-xlrd
  python-pandas python-matplotlib python-pymysql python-pyro python-pint)
optdepends=('cplex: IBM ILOG CPLEX Optimization Studio'
            'glpk: GNU Linear Programming Kit support'
            'gurobi: Gurobi solver support'
            'mosek: MOSEK solver support')
makedepends=(python-setuptools cython)

source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c8ad55213ff8b1a2c4e469110db8079722d5a6f364c6c46a42e2f750fc9e4d26')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
