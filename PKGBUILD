# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-catkin_lint')
pkgver='1.6.14'
pkgrel=2
pkgdesc='Check catkin packages for common errors'
arch=('any')
url='https://github.com/fkie/catkin_lint'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-lxml')
makedepends=('python2-setuptools')
provides=('python2-catkin-lint')
conflicts=('python-catkin_lint' 'python2-catkin-lint')
source=("https://github.com/fkie/catkin_lint/archive/${pkgver}.tar.gz")
sha256sums=('e460c114f0206d4fbfd13161bf2795e96fe8b20b457c829533c9240939e9c40f')

_module='catkin_lint'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
