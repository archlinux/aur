# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-rosdep')
pkgver='0.20.1'
pkgrel=1
pkgdesc='rosdep package manager abstraction tool for ROS'
arch=('any')
url='https://github.com/ros-infrastructure/rosdep'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-rosdep')
source=("https://github.com/ros-infrastructure/rosdep/archive/${pkgver}.tar.gz")
sha256sums=('135334cd4719c77cd268904dce012ae8a75c238c5f3d4eb945e7ae2310d54cca')

_module='rosdep'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
