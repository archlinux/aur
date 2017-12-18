pkgname='python-tabledata'
_module='tabledata'
pkgver='0.0.5'
pkgrel=1
pkgdesc="A Python library to represent tabular data for pytablewriter/pytablereader/SimpleSQLite."
url="https://github.com/thombashi/tabledata"
depends=('python' 'python-pathvalidate>=0.16.2' 'python-dataproperty>=0.29.1' 'python-logbook>=1.1.0' 'python-six' 'python-typepy>=0.0.20')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/tabledata/archive/v${pkgver}.tar.gz")
md5sums=('7b6256da07b2381c50cb8db8df1241f9')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
