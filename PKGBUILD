# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosdep'
pkgname=('python-rosdep')
_module='rosdep'
pkgver='0.19.0'
pkgrel=1
pkgdesc="rosdep package manager abstraction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdep')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('92e5975eddd528da224b39b112a4f6539d89bd20bbbaa73ab51d43d395ce662e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
