# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python2-catkin_lint')
pkgver='1.6.16'
pkgrel=1
pkgdesc='Check catkin packages for common errors'
arch=('any')
url='https://github.com/fkie/catkin_lint'
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-lxml')
makedepends=('python2-setuptools')
provides=('python2-catkin-lint')
conflicts=('python-catkin_lint' 'python2-catkin-lint')
source=("https://github.com/fkie/catkin_lint/archive/${pkgver}.tar.gz")
sha256sums=('ca9de386450a6fe64bea05a52276d780489ada69ade8b94330db81fe6782f104')

_module='catkin_lint'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
