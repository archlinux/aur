# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin_lint'
pkgname=('python-catkin_lint')
_module='catkin_lint'
pkgver='1.5.5'
pkgrel=1
pkgdesc="Check catkin packages for common errors"
url="https://github.com/fkie/catkin_lint"
depends=('python' 'python-catkin_pkg')
provides=('python-catkin-lint')
conflicts=('python2-catkin_lint' 'python-catkin-lint')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/catkin_lint/catkin_lint-${pkgver}.tar.gz")
md5sums=('b80b1ababb4f06fcdc7ac0d9119de7cd')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
