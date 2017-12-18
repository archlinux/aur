pkgname='python-subprocrunner'
_module='subprocrunner'
pkgver='0.10.0'
pkgrel=1
pkgdesc="A Python wrapper library for subprocess module."
url="https://github.com/thombashi/subprocrunner"
depends=('python' 'python-logbook>=1.1.0' 'python-mbstrdecoder' 'python-six' 'python-typepy>=0.0.20')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/subprocrunner/archive/v${pkgver}.tar.gz")
md5sums=('257cc2cc7fd830758c8a33f29c32f6e7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
