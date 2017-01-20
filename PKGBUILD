pkgname=('python-cvxpy')
_module='cvxpy'
pkgver='0.4.8'
pkgrel=2
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
license=('GPL3')
arch=('any')
source=("https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('d8d957449aed59c1e6c4b1f3984f637e996816f3a824bc061712e69c40b1e3b9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
