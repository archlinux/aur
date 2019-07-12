pkgname=('python-cvxpy')
_module='cvxpy'
pkgver='1.0.24'
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
sha256sums=('a1705c338026d501dcf1480b107afb5e0d9bc7338226e37dceaf4a96f9eb84c2')

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
