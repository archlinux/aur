# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rosdep')
pkgver='0.21.0'
pkgrel=1
pkgdesc='rosdep package manager abstraction tool for ROS'
arch=('any')
url='https://github.com/ros-infrastructure/rosdep'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rosdep')
source=("https://github.com/ros-infrastructure/rosdep/archive/${pkgver}.tar.gz")
sha256sums=('36855f69398f6d6973dbdaa8f50204f9d7cbdfecf9fb74df6aae2c0510451a18')

_module='rosdep'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
