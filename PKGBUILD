# Maintainer: Paul Irofti <paul@irofti.net>
_name=Pyomo
pkgname="python-${_name,,}"
pkgver=6.8.0
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
sha256sums=('a204a78d8ed5fa7ad8fa94d3c8ed4f6da38b5c02a68b8fe446bc694f16c8d1ea')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
