# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rospkg')
pkgver='1.2.8'
pkgrel=1
pkgdesc='Standalone Python library for the ROS package system'
arch=('any')
url='https://github.com/ros-infrastructure/rospkg'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rospkg')
source=("https://github.com/ros-infrastructure/rospkg/archive/${pkgver}.tar.gz")
sha256sums=('39e801b104e4c31ddc60a0c1a526197429cfbbe72b574a3cad851e624ff54249')

_module='rospkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
