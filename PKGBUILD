# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-catkin_pkg')
pkgver='0.4.20'
pkgrel=2
pkgdesc='Standalone Python library for the catkin package system'
arch=('any')
url='https://github.com/ros-infrastructure/catkin_pkg'
license=('BSD')
depends=('python2' 'python2-argparse' 'python2-dateutil' 'python2-docutils' 'python2-pyparsing')
makedepends=('python2-setuptools')
provides=('python2-catkin-pkg')
conflicts=('python-catkin_pkg' 'python2-catkin-pkg')
source=("https://github.com/ros-infrastructure/catkin_pkg/archive/${pkgver}.tar.gz")
sha256sums=('4f3dd4dd08360205da899610a4296d017bdef48a4c3e6e15923e6c04a2d35bee')

_module='catkin_pkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
