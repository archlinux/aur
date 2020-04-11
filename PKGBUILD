pkgname='python-cvxpy'
_module='cvxpy'
pkgver='1.0.29'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems"
url="http://github.com/cvxgrp/cvxpy/"
depends=('python'
    'python-ecos'
    'python-fastcache'
    'python-multiprocess'
    'python-numpy'
    'python-scipy'
    'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-scs' 'python-osqp')
checkdepends=('python-nose' 'python-osqp' 'python-scs')
license=('Apache')
arch=('any')
source=("https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('0369ba469cbf43e8f4b6d1a8afd528abed754bb63d8d8dd76f412c8f190a1abd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

#check() {
    #cd "${srcdir}/${_module}-${pkgver}"
    #python setup.py build_ext --inplace
    #nosetests cvxpy
#}
