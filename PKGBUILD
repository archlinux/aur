# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosdep'
pkgname=('python-rosdep')
_module='rosdep'
pkgver='0.18.0'
pkgrel=1
pkgdesc="rosdep package manager abstraction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdep')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('86179750b73739c8ef35378e292f4f400681bb3cb53af8d1512be16ea7c5c484')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
