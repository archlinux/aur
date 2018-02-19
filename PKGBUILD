# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-rosdep')
pkgname=('python-rosdep')
_module='rosdep'
pkgver='0.12.1'
pkgrel=1
pkgdesc="rosdep package manager abstrction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdep')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdep/rosdep-${pkgver}.tar.gz")
md5sums=('2162099682370a806fba590abb91e6da')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
