# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-stumpy-git"
pkgver=1.8.0.r3.gc76f668
pkgrel=2
pkgdesc="powerful and scalable library that computes the matrix profile"
url="https://github.com/TDAmeritrade/stumpy"
depends=('python' 'python-scipy' 'python-numpy' 'python-numba')
makedepends=('git' 'python-setuptools')
provides=('python-stumpy')
conflicts=('python-stumpy')
arch=('any')
license=('BSD')
source=("git+https://github.com/TDAmeritrade/stumpy")
md5sums=('SKIP')

pkgver() {
    cd "stumpy"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "stumpy"
    python setup.py build
}

package() {
  cd "stumpy"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
