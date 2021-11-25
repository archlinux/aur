# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-catkin_tools')
pkgver='0.7.2'
pkgrel=1
pkgdesc='Command line tools for working with catkin'
arch=('any')
url='https://github.com/catkin/catkin_tools'
license=('Apache')
depends=('python2' 'python2-catkin_pkg' 'python2-osrf_pycommon' 'python2-trollius' 'python2-yaml')
makedepends=('python2-setuptools')
provides=('python2-catkin-tools')
conflicts=('python-catkin_tools' 'python2-catkin-tools')
source=("https://github.com/catkin/catkin_tools/archive/${pkgver}.tar.gz")
sha256sums=('8da59ee1cf680832e29b67f3076892c0eded1559a5f8593785319da696d1c664')

_module='catkin_tools'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
