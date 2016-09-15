pkgbase=('python-cvxpy')
pkgname=('python-cvxpy')
_module='cvxpy'
pkgver='0.4.5'
pkgrel=1
pkgdesc="A domain-specific language for modeling convex optimization problems in Python."
url="http://github.com/cvxgrp/cvxpy/"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/f5/c9/ac3c194d4ed7046f64dfc1bcc1dc7f83d7b4eb0fdf02a84ada15a53ba7ef/cvxpy-${pkgver}.tar.gz")
md5sums=('6b90de7880507c0583d5e789ca4ad193')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
