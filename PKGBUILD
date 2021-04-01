# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rospkg')
pkgver='1.3.0'
pkgrel=1
pkgdesc='Standalone Python library for the ROS package system'
arch=('any')
url='https://github.com/ros-infrastructure/rospkg'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rospkg')
source=("https://github.com/ros-infrastructure/rospkg/archive/${pkgver}.tar.gz")
sha256sums=('9be88b9267603e7f51c3cb35e407df8d81465ce12c0615a9f92c4932414a4ab5')

_module='rospkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
