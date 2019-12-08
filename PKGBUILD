# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin_lint'
pkgname=('python-catkin_lint')
_module='catkin_lint'
pkgver='1.6.3'
pkgrel=1
pkgdesc="Check catkin packages for common errors"
url="https://github.com/fkie/catkin_lint"
depends=('python' 'python-catkin_pkg')
provides=('python-catkin-lint')
conflicts=('python2-catkin_lint' 'python-catkin-lint')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('b279f157bef99fc2377a310f82aa4d8e8519eaf135bb272e22d6e09a9fd7695b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
