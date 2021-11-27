pkgname='python-msgfy'
_module='msgfy'
pkgver='0.2.0'
pkgrel=1
pkgdesc="A Python library for converting an Exception instance into a human-readable error message"
url="https://github.com/thombashi/msgfy"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/msgfy/archive/v${pkgver}.tar.gz")
sha256sums=('b3c37b3b639870544e902de2ad0d15ac4a88bad25ff32d00e650f7907c80f9fd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
