pkgname='python-cvxpy'
_module='cvxpy'
pkgver='1.1.7'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems"
url="http://github.com/cvxgrp/cvxpy/"
depends=('python-ecos'
    'python-fastcache'
    'python-multiprocess'
    'python-numpy'
    'python-scipy'
    'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-scs' 'python-osqp')
checkdepends=('python-pytest' 'python-osqp' 'python-scs')
license=('Apache')
arch=('any')
source=("https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('9e20330dad2487e04bf27ba270145e04e2f7e7fdb6d29d4fc7f71092edf08408')

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

#check() {
    #cd "${_module}-${pkgver}"
    #python setup.py build_ext --inplace
    #pytest cvxpy/tests
#}
