# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-catkin_pkg')
pkgname=('python-catkin_pkg')
_module='catkin_pkg'
pkgver='0.4.1'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
depends=('python' 'python-argparse' 'python-dateutil' 'python-docutils')
provides=('python-catkin-pkg')
conflicts=('python2-catkin_pkg' 'python-catkin-pkg')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_pkg/catkin_pkg-${pkgver}.tar.gz")
md5sums=('156438ff41d274450a7ff7887a8127d8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
