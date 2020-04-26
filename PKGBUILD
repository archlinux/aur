# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=python-py-params
pkgver=0.9.7
pkgrel=1
pkgdesc="A type-safe dictionary class for python."
url="https://github.com/kpe/py-params"
arch=(x86_64)
makedepends=(git python 'python-setuptools')
_pkgver="0.9.7"
source=(
  "https://github.com/kpe/py-params/archive/v$_pkgver.tar.gz"
)
sha256sums=(
  "a72a94968955edb42cdc1a6ff8e1b3b7b9af3ebec342e9e157eeba05a1f9db81"
)


build() {
    cd "$srcdir/py-params-$_pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/py-params-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
