# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pystan
pkgver=2.19.0.0
pkgrel=1
pkgdesc="Python interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=(GPLv3)
depends=(python-numpy cython)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b85301b960d5991918b40bd64a4e9321813657a9fc028e0f39edce7220a309eb')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
