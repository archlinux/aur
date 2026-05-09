pkgname='python-msgfy'
_module='msgfy'
pkgver='0.2.1'
pkgrel=1
pkgdesc="A Python library for converting an Exception instance into a human-readable error message"
url="https://github.com/thombashi/msgfy"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/msgfy/archive/v${pkgver}.tar.gz")
sha256sums=('f705a968b193270acc8784cb1c9e9843bd09ff9c157a1e326864119dfde393b8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
