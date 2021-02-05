# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-osrf_pycommon')
pkgver='0.2.1'
pkgrel=1
pkgdesc='Commonly needed Python modules, used by Python software developed at OSRF'
arch=('any')
url='https://github.com/osrf/osrf_pycommon'
license=('Apache')
depends=('python2' 'python2-trollius')
makedepends=('python2-setuptools')
provides=('python2-osrf-pycommon')
conflicts=('python2-osrf-pycommon')
source=("https://github.com/osrf/osrf_pycommon/archive/${pkgver}.tar.gz")
sha256sums=('b369b0d4d81bf3e9f89b38d5b81a957c7e435715e8e9ff06104b975b6e90b119')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
