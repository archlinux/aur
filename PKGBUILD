# Maintainer: Paul Irofti <paul@irofti.net>
_name=pyomo
pkgname="python-${_name,,}"
pkgver=6.9.4
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
sha256sums=('34ad22cd6bf9956de9c0d3842d01c1f92dee0515b25aa3e8f113b326549b1231')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
