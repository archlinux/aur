# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_pkg'
pkgname=('python2-catkin_pkg')
_module='catkin_pkg'
pkgver='0.4.20'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
depends=('python2' 'python2-argparse' 'python2-dateutil' 'python2-docutils' 'python2-pyparsing')
provides=('python2-catkin-pkg')
conflicts=('python-catkin_pkg' 'python2-catkin-pkg')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c8ea11c2785d8b9fe4553ef3df2da5a5e1d2721c50a735d4379b837d0679b01a')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
