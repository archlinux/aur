# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase=('python-catkin_pkg')
pkgname=('python-catkin_pkg')
_module='catkin_pkg'
pkgver='0.3.5'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
depends=()
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_pkg/catkin_pkg-${pkgver}.tar.gz")
md5sums=('de01650bbec245d53f72682ed7ab13e5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package_python-catkin_pkg() {
    depends+=('python' 'python-argparse' 'python-dateutil' 'python-docutils')
    provides=('python-catkin-pkg')
    conflicts=('python2-catkin_pkg' 'python-catkin-pkg')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
