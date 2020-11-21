# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-rospkg')
pkgver='1.2.9'
pkgrel=1
pkgdesc='Standalone Python library for the ROS package system'
arch=('any')
url='https://github.com/ros-infrastructure/rospkg'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-distro' 'python-yaml')
makedepends=('python-setuptools')

conflicts=('python2-rospkg')
source=("https://github.com/ros-infrastructure/rospkg/archive/${pkgver}.tar.gz")
sha256sums=('518205cddc3259b3cb410466f70af832cb7ea8222862fc14831e2ea7f8970c44')

_module='rospkg'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
