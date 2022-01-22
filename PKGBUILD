# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-osrf_pycommon')
pkgver='1.0.1'
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
sha256sums=('a892be6acfde3c8f209124d8da0e7fd8b6f9630f56e2e696884449cce342dc0d')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
