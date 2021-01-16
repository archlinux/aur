# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-catkin_lint')
pkgver='1.6.12'
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
sha256sums=('b66a6677e08577bb01d1031645abd46d1c8a59ae56692c8589889ed3bfd46f80')

_module='catkin_lint'

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
