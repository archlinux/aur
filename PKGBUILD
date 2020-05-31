# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rosdep')
pkgver='0.19.0'
pkgrel=2
pkgdesc='rosdep package manager abstraction tool for ROS'
arch=('any')
url='https://github.com/ros-infrastructure/rosdep'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rosdep')
source=("https://github.com/ros-infrastructure/rosdep/archive/${pkgver}.tar.gz")
sha256sums=('4497f7d220eec5d322bea95484d7bb66daeabdaec762b9095c4cf28759f3d55c')

_module='rosdep'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
