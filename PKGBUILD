# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=python-py-params
pkgver=0.8.2
pkgrel=1
pkgdesc="A type-safe dictionary class for python."
url="https://github.com/kpe/py-params"
arch=(x86_64)
makedepends=(git python 'python-setuptools')
_pkgver="0.8.2"
source=(
  "https://github.com/kpe/py-params/archive/v$_pkgver.tar.gz"
)
sha256sums=(
  "0de74db6b12379d5659419794e9273185784fb0b2e86a134319a22d1486f1876"
)


build() {
    cd "$srcdir/py-params-$_pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/py-params-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
