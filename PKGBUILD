# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-pyod-git"
pkgver=0.8.6.r0.g885f73c
pkgrel=2
pkgdesc="Python toolkit for detecting outlying objects in multivariate data."
url="https://github.com/yzhao062/pyod"
depends=('python' 'python-combo-git' 'python-joblib' 'python-matplotlib'
    'python-numpy' 'python-numba' 'python-pandas' 'python-scipy'
    'python-scikit-learn' 'python-six' 'python-statsmodels' 'python-suod-git')
makedepends=('git' 'python-setuptools')
optdepends=('python-keras-applications: required for AutoEncoder'
            'python-tensorflow: required for AutoEncoder, other backend works')
provides=('python-pyod')
conflicts=('python-pyod')
arch=('any')
license=('BSD')
source=("git+https://github.com/yzhao062/pyod.git")
md5sums=('SKIP')

pkgver() {
    cd "pyod"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^V//'
}

prepare() {
    cd "pyod"
    rm examples/__init__.py
}

build() {
    cd "pyod"
    python setup.py build
}

package() {
  cd "pyod"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
