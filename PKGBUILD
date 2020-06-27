# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rosinstall_generator')
pkgver='0.1.21'
pkgrel=1
pkgdesc='A tool for generating rosinstall files'
arch=('any')
url='https://github.com/ros-infrastructure/rosinstall_generator'
license=('BSD')
depends=('python2' 'python2-argparse' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
makedepends=('python2-setuptools')
provides=('python2-rosinstall-generator')
conflicts=('python-rosinstall_generator' 'python2-rosinstall-generator')
source=("https://github.com/ros-infrastructure/rosinstall_generator/archive/${pkgver}.tar.gz")
sha256sums=('4c5efbb8e5be8cbb90147cbd69e469128039906e5c49193c80da3f6c6ea9a40b')

_module='rosinstall_generator'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
