pkgname=python-hdmedians
_module='hdmedians'
pkgver=0.14.1
pkgrel=1
pkgdesc="High-dimensional medians"
url="http://github.com/daleroberts/hdmedians"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=(x86_64)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daleroberts/hdmedians/archive/v${pkgver}.tar.gz")
md5sums=('6dcf388f56a144f7e7bb5aac8c4d888e')

build() {
    cd ${_module}-${pkgver}
    python setup.py build
}

check() {
    cd ${_module}-${pkgver}
    python setup.py test || :
}

package() {
    cd ${_module}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
