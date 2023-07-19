# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-osrf_pycommon')
pkgver='2.1.3'
pkgrel=1
pkgdesc='Commonly needed Python modules, used by Python software developed at OSRF'
arch=('any')
url='https://github.com/osrf/osrf_pycommon'
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
provides=('python-osrf-pycommon')
conflicts=('python-osrf-pycommon')
source=("https://github.com/osrf/osrf_pycommon/archive/${pkgver}.tar.gz")
sha256sums=('1e819440884682ca4c41027d1d7826f2788655ca0285ad4a83462dd41499e3c9')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
