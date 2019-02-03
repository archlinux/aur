# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosdep'
pkgname=('python2-rosdep')
_module='rosdep'
pkgver='0.15.0'
pkgrel=1
pkgdesc="rosdep package manager abstraction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
conflicts=('python-rosdep')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('2b3e1dc000a6c8c08c3fbb327e79a4de')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
