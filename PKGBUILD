# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rospkg')
pkgver='1.2.6'
pkgrel=2
pkgdesc='Standalone Python library for the ROS package system'
arch=('any')
url='https://github.com/ros-infrastructure/rospkg'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rospkg')
source=("https://github.com/ros-infrastructure/rospkg/archive/${pkgver}.tar.gz")
sha256sums=('6fec215df97895b3906660fed736544b7232635dd3a62e6a8aae553159e67ac2')

_module='rospkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
