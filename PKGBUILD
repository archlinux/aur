#Maintainer: Florian Wittmann <fl0w1@disroot.org>
pkgname='python-simplesqlite'
_module='SimpleSQLite'
pkgver='0.15.0'
pkgrel=1
pkgdesc="SimpleSQLite is a Python library to simplify SQLite database operations: table creation, data insertion and get data as other data formats."
url="https://github.com/thombashi/SimpleSQLite"
depends=('python' 'python-pathvalidate>=0.16.1' 'python-pytablereader>=0.13.0' 'python-dataproperty' 'python-logbook>=1.1.0' 'python-mbstrdecoder' \
	 'python-six' 'python-typepy>=0.0.20')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/SimpleSQLite/archive/v0${pkgver}.tar.gz")
md5sums=('be05735a65f91bf0bb47c2bfcf474dd3')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
