pkgname='python-pathvalidate'
_module='pathvalidate'
pkgver='0.29.0'
pkgrel=1
pkgdesc='A Python library to sanitize/validate a string such as filenames/file-paths/etc'
url='https://github.com/thombashi/pathvalidate'
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-faker' 'python-pytest' 'python-six')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/pathvalidate/archive/v${pkgver}.tar.gz")
sha256sums=('6cab2cc4f757b8493df6d3aa84b49a66a47020105b97794b22ef7e5629f15162')

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py test
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
