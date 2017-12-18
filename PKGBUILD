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
md5sums=('df89ed846d6a485f2f7ba69a5ee45392')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
