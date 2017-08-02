# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python2-rosdep')
pkgname=('python2-rosdep')
_module='rosdep'
pkgver='0.11.7'
pkgrel=1
pkgdesc="rosdep package manager abstrction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
conflicts=('python-rosdep')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('48c14a114c3ac3cda1e8179e1b830504')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
