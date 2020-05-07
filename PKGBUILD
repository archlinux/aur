# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_pkg'
pkgname=('python2-catkin_pkg')
_module='catkin_pkg'
pkgver='0.4.18'
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
sha256sums=('5f885ae05e8655bff897f3f9acd4469801583fcb02bae73ff9ea55b8208e3f9d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
