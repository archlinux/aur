# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=python-params-flow
pkgver=0.8.1
pkgrel=1
pkgdesc="A TensorFlow Keras coding style for reducing boilerplate code in custom layers and models."
url="https://github.com/kpe/params-flow"
arch=(x86_64)
makedepends=(git python 'python-setuptools')
_pkgver="0.8.1"
source=(
  "https://github.com/kpe/params-flow/archive/v$_pkgver.tar.gz"
)
sha256sums=(
  "41b95d63bc549482bd0df3cf7d66047e7380c1483e6084e5d37996eb8b0f9570"
)


build() {
    cd "$srcdir/params-flow-$_pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/params-flow-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
