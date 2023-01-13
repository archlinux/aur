# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-osrf_pycommon')
pkgver='2.1.1'
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
sha256sums=('881e1c63d6009fe35af730c2f21099a214121f1493707aa7869a7cfec2b704dd')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
