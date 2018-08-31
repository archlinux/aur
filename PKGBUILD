pkgname=('python-cvxpy')
_module='cvxpy'
pkgver='1.0.8'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems in Python."
url="http://github.com/cvxgrp/cvxpy/"
depends=('python'
    'python-ecos'
    'python-fastcache'
    'python-multiprocess'
    'python-numpy'
    'python-scipy'
    'python-toolz')
makedepends=('python-setuptools')
optdepends=('python-scs' 'python-nose')
checkdepends=('python-scs')
license=('Apache')
arch=('any')
source=("https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('5e96ebaa7abbc4fc2dddad6defec8a434158c128996725541b30efff06ae2e3a')

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
