# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-catkin_lint'
pkgname=('python2-catkin_lint')
_module='catkin_lint'
pkgver='1.6.1'
pkgrel=1
pkgdesc="Check catkin packages for common errors"
url="https://github.com/fkie/catkin_lint"
depends=('python2' 'python2-catkin_pkg')
provides=('python2-catkin-lint')
conflicts=('python-catkin_lint' 'python2-catkin-lint')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/e1/c5/0ea8509779e09623cc012c91639dddaa8d359f54e3e4a0b8478bbe5d2b52/catkin_lint-1.6.1.tar.gz")
sha256sums=('5435ae5055cb94b0e7524d7a88c39e64a8cac397a40d75b4823e10b43fb94335')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
