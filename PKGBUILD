# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=arpy
pkgname="python-$_name"
pkgver=2.1.0
pkgrel=2
pkgdesc="Library for accessing 'ar' files"
arch=(any)
url="https://pypi.org/pypi/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('332d0fb6e96d497ad8746c61e586206f8718c217e39cf98fe50ec23d3f36d755')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
