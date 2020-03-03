pkgname='python-pathvalidate'
_module='pathvalidate'
pkgver='2.2.0'
pkgrel=1
pkgdesc='A Python library to sanitize/validate a string such as filenames/file-paths/etc'
url='https://github.com/thombashi/pathvalidate'
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-allpairspy' 'python-faker' 'python-click' 'python-pytest')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/pathvalidate/archive/v${pkgver}.tar.gz")
sha256sums=('42d087e9aacff04770760888fec254d2ccf10fb542edc26d83c29791305ae485')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    pytest
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
