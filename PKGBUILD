pkgname=('python-scs')
_pkgname='scs'
pkgver='1.2.7'
pkgrel=1
pkgdesc="Convex cone solver via operator splitting."
url="http://github.com/cvxgrp/scs/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "LICENSE.txt")
sha256sums=('e284517e31bd8aac2e1e022376c46bade26d55ce4ef078cf796a9e70ab2b2433'
            '47d0bba3f33546d08d9dea012d70b1362d2e917553bb751183fcf046519fd868')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 ../../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
