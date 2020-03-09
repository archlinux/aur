# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=mergedict
pkgname="python-$_name"
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python dict with a merge() method"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('MIT')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e1992b36a54229014fbcbc7a9c8c28d1f4ae131ea1d8d345c93973f9f0dc6fdc')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  depends=('python')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
