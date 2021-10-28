# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-catkin_pkg')
pkgver='0.4.24'
pkgrel=1
pkgdesc='Standalone Python library for the catkin package system'
arch=('any')
url='https://github.com/ros-infrastructure/catkin_pkg'
license=('BSD')
depends=('python2' 'python2-argparse' 'python2-dateutil' 'python2-docutils' 'python2-pyparsing')
makedepends=('python2-setuptools')
provides=('python2-catkin-pkg')
conflicts=('python-catkin_pkg' 'python2-catkin-pkg')
source=("https://github.com/ros-infrastructure/catkin_pkg/archive/${pkgver}.tar.gz")
sha256sums=('57ea09fd51d9a67ccf5a0660a8f84794304182c4f644f27ad835a979567893b1')

_module='catkin_pkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
