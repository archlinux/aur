pkgname=('python-cvxpy')
_module='cvxpy'
pkgver='0.4.10'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems in Python."
url="http://github.com/cvxgrp/cvxpy/"
depends=('python'
    'python-ecos'
    'python-fastcache'
    'python-multiprocess'
    'python-numpy'
    'python-scipy'
    'python-toolz'
    'python-cvxcanon')
makedepends=('python-setuptools')
optdepends=('python-scs')
checkdepends=('python-scs')
license=('Apache')
arch=('any')
source=("https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('33216f81efe3b369164203c075fce24eeee372902ef4b939f5b90ec1120513f0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

#check() {
#    cd "${srcdir}/${_module}-${pkgver}"
#    python -m unittest
#}
