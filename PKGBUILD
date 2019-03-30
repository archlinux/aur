# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pystan
pkgver=2.18.0.1
pkgrel=1
pkgdesc="Python interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=(GPLv3)
depends=(python-numpy cython)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f8d50218d00848bff7cc9f33471eb5c0cf0f84af0a807963349a7931bb782b46')
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
