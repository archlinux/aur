# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=arpy
pkgname="python-$_name"
pkgver=1.1.1
pkgrel=3
pkgdesc="Library for accessing 'ar' files"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3ec36309d2234648ef8dcd2118fe7d81c30195087e0353473546583f3434e776')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
