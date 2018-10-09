# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_lint'
pkgname=('python2-catkin_lint')
_module='catkin_lint'
pkgver='1.5.3'
pkgrel=1
pkgdesc="Check catkin packages for common errors"
url="https://github.com/fkie/catkin_lint"
depends=('python2' 'python2-catkin_pkg')
provides=('python2-catkin-lint')
conflicts=('python-catkin_lint' 'python2-catkin-lint')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_lint/catkin_lint-${pkgver}.tar.gz")
md5sums=('0c5b97677387c4e858861863e9ec1de0')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
