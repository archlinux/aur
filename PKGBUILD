# Maintainer: Paul Irofti <paul@irofti.net>
_name=pyomo
pkgname="python-${_name,,}"
pkgver=6.9.2
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
sha256sums=('81b2b14ea619244824e1c547cc12602fe9a6e19309cbf0742868c5b1ef37cb35')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
