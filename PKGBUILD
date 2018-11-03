# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pystan
pkgver=2.18.0.0
pkgrel=1
pkgdesc="Python interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=(GPLv3-networkx)
depends=(python-numpy cython)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('594c1523fd5cd6034ba1b58b1a0741f7e753c819d17745395defa25e526115ce')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
