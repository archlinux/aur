# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-catkin_tools')
pkgver='0.9.3'
pkgrel=1
pkgdesc='Command line tools for working with catkin'
arch=('any')
url='https://github.com/catkin/catkin_tools'
license=('Apache')
depends=('python' 'python-catkin_pkg' 'python-osrf_pycommon' 'python-setuptools' 'python-yaml')
makedepends=('python-setuptools')
provides=('python-catkin-tools')
conflicts=('python2-catkin_tools' 'python-catkin-tools')
source=("https://github.com/catkin/catkin_tools/archive/${pkgver}.tar.gz")
sha256sums=('22965e8e4fd8d30676c53e582a4c8840fba54e0e4b8b4ba8a671e19c89aaa3bd')

_module='catkin_tools'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
