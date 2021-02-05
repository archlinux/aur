# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-osrf_pycommon')
pkgver='0.2.1'
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
sha256sums=('b369b0d4d81bf3e9f89b38d5b81a957c7e435715e8e9ff06104b975b6e90b119')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
