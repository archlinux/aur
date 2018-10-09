# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_pkg'
pkgname=('python2-catkin_pkg')
_module='catkin_pkg'
pkgver='0.4.8'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
depends=('python2' 'python2-argparse' 'python2-dateutil' 'python2-docutils')
provides=('python2-catkin-pkg')
conflicts=('python-catkin_pkg' 'python2-catkin-pkg')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_pkg/catkin_pkg-${pkgver}.tar.gz")
md5sums=('fa33b26d1a83896e90d57b9d8487cc4f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
