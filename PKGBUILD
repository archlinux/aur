pkgname=('python-scs')
_module='scs'
pkgver='1.2.6'
pkgrel=1
pkgdesc="Convex cone solver via operator splitting."
url="http://github.com/cvxgrp/scs/"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('i686' 'x86_64')
source=("https://github.com/cvxgrp/scs/archive/v${pkgver}.tar.gz")
sha256sums=('b4bebb43a1257b6e88a5f97c855c0559d6c8a8c0548d3156fc5a28d82bb9533f')

build() {
    cd "${srcdir}/${_module}-${pkgver}/python"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT"
    cd "python"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
