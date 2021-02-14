# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-dirty_cat-git"
pkgver=0.0.5.r203.g3c55029
pkgrel=1
pkgdesc="machine-learning on dirty categorical variables"
url="https://github.com/dirty-cat/dirty_cat"
depends=('python' 'python-joblib' 'python-numpy' 'python-scipy'
    'python-scikit-learn' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=('python-dirty_cat')
conflicts=('python-dirty_cat')
arch=('any')
license=('BSD')
source=("git+https://github.com/dirty-cat/dirty_cat.git")
md5sums=('SKIP')

pkgver() {
    cd "dirty_cat"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "dirty_cat"
    python setup.py build
}

package() {
  cd "dirty_cat"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
