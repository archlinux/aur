# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosdep'
pkgname=('python-rosdep')
_module='rosdep'
pkgver='0.15.2'
pkgrel=1
pkgdesc="rosdep package manager abstraction tool for ROS"
url="http://wiki.ros.org/rosdep"
depends=('python' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdep')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/f8/e8/118c42d444a5cbeb8550a70cbc16a2204593df8cfa7314af2f30c12f53e7/rosdep-0.15.2.tar.gz")
sha256sums=('1456e2377d81eade0b4ae0a97205610221d26f60b37c773058002d17860bddff')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
