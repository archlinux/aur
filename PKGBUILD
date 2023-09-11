# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-catkin_tools')
pkgver='0.9.4'
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
sha256sums=('5b6e1867b0e82b7a69b847be170d808074f6b817c44766d261bca55856475647')

_module='catkin_tools'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
