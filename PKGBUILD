# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-combo-git"
pkgver=V0.1.0.r9.g6b569d7
pkgrel=1
pkgdesc="Python toolbox for combining machine learning (ML) models and scores."
url="https://github.com/yzhao062/combo"
depends=('python' 'python-joblib' 'python-matplotlib' 'python-numpy'
    'python-numba' 'python-scipy' 'python-scikit-learn')
makedepends=('git' 'cython')
provides=('python-combo-git')
arch=('any')
license=('BSD')
source=("git://github.com/yzhao062/combo.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/combo"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/combo"
    python setup.py build
}

package() {
  cd "$srcdir/combo"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
