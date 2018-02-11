# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-jsondiff
_pkgname=jsondiff
pkgver=1.1.1
pkgrel=1
pkgdesc="Diff JSON and JSON-like structures in Python"
arch=('any')
url="https://github.com/Zoomer-Analytics/jsondiff"
license=('MIT')
depends=('python')
checkdepends=('python-nose-random')
optdepends=()
makedepends=('python-setuptools')
source=("https://github.com/ZoomerAnalytics/jsondiff/archive/v$pkgver.tar.gz")
sha256sums=('681eaaefc926738342281e7b92e202ea642cac9d6045b530fc23e936f61057a5')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

check(){
  cd "$srcdir/$_pkgname-$pkgver"
  nosetests tests/
}
# vim:ts=2:sw=2:et:
