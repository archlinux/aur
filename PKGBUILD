# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=python-params-flow
pkgver=0.7.4
pkgrel=1
pkgdesc="A TensorFlow Keras coding style for reducing boilerplate code in custom layers and models."
url="https://github.com/kpe/params-flow"
arch=(x86_64)
makedepends=(git python 'python-setuptools')
_pkgver="0.7.4"
source=(
  "https://github.com/kpe/params-flow/archive/v$_pkgver.tar.gz"
)
sha256sums=(
  "8467c4ef7d773ea87522525042d4bbb8de424e3819fb826573975b4bd0411bc4"
)


build() {
    cd "$srcdir/params-flow-$_pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/params-flow-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
