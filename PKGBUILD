# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=arpy
pkgname="python-$_name"
pkgver=2.2.0
pkgrel=2
pkgdesc="Library for accessing 'ar' files"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e07dfefc4cdf3d8b080e4b37e8c2b8360e7741b10faf6528f820b74999e0e6bc')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
