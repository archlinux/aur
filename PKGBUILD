# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-rosdistro')
pkgver='0.8.2'
pkgrel=2
pkgdesc='A tool to work with rosdistro files'
arch=('any')
url='https://github.com/ros-infrastructure/rosdistro'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-yaml')
makedepends=('python2-setuptools')

conflicts=('python-rosdistro')
source=("https://github.com/ros-infrastructure/rosdistro/archive/${pkgver}.tar.gz")
sha256sums=('ca6e7955820658781bde572927895c2ae8d89c37d5d891a254fd9cc29f9904a6')

_module='rosdistro'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
