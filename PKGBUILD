# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosdistro'
pkgname=('python-rosdistro')
_module='rosdistro'
pkgver='0.6.9'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python' 'python-catkin_pkg' 'python-rospkg' 'python-yaml')
conflicts=('python2-rosdistro')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/r/rosdistro/rosdistro-${pkgver}.tar.gz")
md5sums=('2fe56c85936c0f944e405d6e5f025f5d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
