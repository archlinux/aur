# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin_pkg'
pkgname=('python-catkin_pkg')
_module='catkin_pkg'
pkgver='0.4.10'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
depends=('python' 'python-argparse' 'python-dateutil' 'python-docutils')
provides=('python-catkin-pkg')
conflicts=('python2-catkin_pkg' 'python-catkin-pkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin-pkg/catkin-pkg-${pkgver}.tar.gz")
md5sums=('0c8752ab98ab06481a2ea7d037ac3878')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
