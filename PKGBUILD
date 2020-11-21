# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rospkg')
pkgver='1.2.9'
pkgrel=1
pkgdesc='Standalone Python library for the ROS package system'
arch=('any')
url='https://github.com/ros-infrastructure/rospkg'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rospkg')
source=("https://github.com/ros-infrastructure/rospkg/archive/${pkgver}.tar.gz")
sha256sums=('518205cddc3259b3cb410466f70af832cb7ea8222862fc14831e2ea7f8970c44')

_module='rospkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
