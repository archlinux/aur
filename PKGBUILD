# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pystan
pkgver=2.19.1.1
pkgrel=2
pkgdesc="Python interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=(GPL3)
depends=(python-numpy cython)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('fa8bad8dbc0da22bbe6f36af56c9abbfcf10f92df8ce627d59a36bd8d25eb038')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
