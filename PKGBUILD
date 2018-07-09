# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jsondiff
_pkgname=jsondiff
pkgver=1.1.2
pkgrel=1
pkgdesc="Diff JSON and JSON-like structures in Python"
arch=('any')
url="https://github.com/ZoomerAnalytics/jsondiff"
license=('MIT')
depends=('python')
checkdepends=('python-nose' 'python-nose-random')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/ZoomerAnalytics/jsondiff/archive/$pkgver.tar.gz")
sha256sums=('8e5edaa604c4a96d9ffe7fea6f39ec91bdddaee78fae7c6ff91cbb8e105b70c1')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests tests/
}
# vim:ts=2:sw=2:et:
