pkgname='python-msgfy'
_module='msgfy'
pkgver='0.1.0'
pkgrel=1
pkgdesc="A Python library for converting an Exception instance into a human-readable error message"
url="https://github.com/thombashi/msgfy"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/msgfy/archive/v${pkgver}.tar.gz")
sha256sums=('5d63a7e50538463b91a5898d95a8cd1c9d06f608e8ab3e6ccd0ca9d9d279c104')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
