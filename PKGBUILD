# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-osrf_pycommon')
pkgver='0.2.0'
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
sha256sums=('067a5061b7b1db84e973f4e79f652c13a78430271bd8590812d296ffa5fb49b9')

_module='osrf_pycommon'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
