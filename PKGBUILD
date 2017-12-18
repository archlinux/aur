pkgname='python-simplesqlite'
_module='SimpleSQLite'
pkgver='0.19.0'
pkgrel=1
pkgdesc="SimpleSQLite is a Python library to simplify SQLite database operations: table creation, data insertion and get data as other data formats."
url="https://github.com/thombashi/SimpleSQLite"
depends=('python' 'python-pathvalidate>=0.16.2' 'python-pytablereader>=0.15.0' 'python-dataproperty' 'python-logbook>=1.1.0' 'python-mbstrdecoder' 'python-six' 'python-typepy>=0.0.20')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/SimpleSQLite/archive/v${pkgver}.tar.gz")
md5sums=('34ea04a94f78e6753542b0131eba6c5a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
