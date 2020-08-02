# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=python-params-flow
pkgver=0.8.2
pkgrel=1
pkgdesc="A TensorFlow Keras coding style for reducing boilerplate code in custom layers and models."
url="https://github.com/kpe/params-flow"
arch=(x86_64)
makedepends=(git python 'python-setuptools')
_pkgver="0.8.2"
source=(
  "https://github.com/kpe/params-flow/archive/v$_pkgver.tar.gz"
)
sha256sums=(
  "7ae336a0112151dcf844e6e6d4d778bccce55175f32f5a5e8eb8825f244038c4"
)


build() {
    cd "$srcdir/params-flow-$_pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/params-flow-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
