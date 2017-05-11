pkgname=('python-cvxpy')
_module='cvxpy'
pkgver='0.4.9'
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
license=('GPL3')
arch=('any')
source=("https://github.com/cvxgrp/cvxpy/archive/v${pkgver}.tar.gz")
sha256sums=('8974219591ba1500d28700faaede2a131571cde959c44277852139d2387fd3d2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
