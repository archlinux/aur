# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-osrf_pycommon')
pkgver='2.1.7'
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
sha256sums=('441afd5c3476474a1e5760070fec18860992a4659e84a6a4b59e49217d7cc6af')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
