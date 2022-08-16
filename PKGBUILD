# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-catkin_lint')
pkgver='1.6.18'
pkgrel=1
pkgdesc='Check catkin packages for common errors'
arch=('any')
url='https://github.com/fkie/catkin_lint'
license=('BSD')
depends=('python' 'python-catkin_pkg' 'python-lxml')
makedepends=('python-setuptools')
provides=('python-catkin-lint')
conflicts=('python2-catkin_lint' 'python-catkin-lint')
source=("https://github.com/fkie/catkin_lint/archive/${pkgver}.tar.gz")
sha256sums=('2cd38c4a94df1fb201617a7a79dbf46572c6d98024be7b8e7dccfa4c79ff2c29')

_module='catkin_lint'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
