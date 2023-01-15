# Maintainer: Anton Kudelin <kudelin at proton dot me>
# Contributor: Håvard Pettersson <mail@haavard.me>

_name=yahoofinancials
pkgname=python-$_name
pkgver=1.9
pkgrel=1
pkgdesc='A financial data module used for pulling data from Yahoo Finance'
url='https://github.com/JECSand/yahoofinancials'
arch=('any')
license=('MIT')
depends=('python-requests' 'python-beautifulsoup4' 'python-pytz'
         'python-cryptography')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b7adc1f4920e74bfe095de77c7ccb22e76b9dc07f5a81857cf91a91aa11faee6')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
