# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-combo-git"
pkgver=0.1.0.r9.g6b569d7
pkgrel=2
pkgdesc="Python toolbox for combining machine learning (ML) models and scores."
url="https://github.com/yzhao062/combo"
depends=('python' 'python-joblib' 'python-matplotlib' 'python-numpy'
    'python-numba' 'python-scipy' 'python-scikit-learn')
makedepends=('git' 'cython')
provides=('python-combo')
conflicts=('python-combo')
arch=('any')
license=('BSD')
source=("git+https://github.com/yzhao062/combo.git")
md5sums=('SKIP')

pkgver() {
    cd "combo"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^V//'
}

build() {
    cd "combo"
    python setup.py build
}

package() {
  cd "combo"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
