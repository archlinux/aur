# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Håvard Pettersson <mail@haavard.me>

_name=yahoofinancials
pkgname=python-$_name
pkgver=1.6
pkgrel=2
pkgdesc='A powerful financial data module used for pulling data from Yahoo Finance'
url='https://github.com/JECSand/yahoofinancials'
arch=('any')
license=('MIT')
depends=('python-requests' 'python-beautifulsoup4' 'python-pytz')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('682e19372c8fe09df47195690cb145884815e6afcbf1c24dabf101433c7e6691')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
