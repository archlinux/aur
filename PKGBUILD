pkgname=python-dataproperty
_module='DataProperty'
pkgver='0.29.1'
pkgrel=1
pkgdesc="Python library for extract property from data."
url="https://github.com/thombashi/DataProperty"
depends=('python')
makedepends=('python-setuptools' 'python-ipaddress' 'python-logbook>=1.1.0' 'python-typepy>=0.0.20' 'python-enum-compat')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/DataProperty/archive/v${pkgver}.tar.gz")
md5sums=('eca5e3eb2efd1314ee21eebb96cd4896')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
