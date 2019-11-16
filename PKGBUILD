# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosdep'
pkgname=('python2-rosdep')
_module='rosdep'
pkgver='0.17.1'
pkgrel=1
pkgdesc="rosdep package manager abstraction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python2' 'python2-catkin_pkg' 'python2-rosdistro' 'python2-rospkg' 'python2-yaml')
conflicts=('python-rosdep')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a9763d8a3c82462adb3de2da51742f65c4bdc2069b4d54d3426f5260a493abef')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
