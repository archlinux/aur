pkgname='python-cvxpy'
_module='cvxpy'
pkgver='1.0.31'
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
sha256sums=('7a1642974c160536c2d0e76e3c814d08116f60582fa586b4c24d057c20b49654')

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
