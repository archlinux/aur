# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosdep')
pkgname=('python-rosdep')
_module='rosdep'
pkgver='0.11.7'
pkgrel=1
pkgdesc="rosdep package manager abstrction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdep')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('48c14a114c3ac3cda1e8179e1b830504')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
