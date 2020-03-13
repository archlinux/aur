# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Håvard Pettersson <mail@haavard.me>

_name=yahoofinancials
pkgname=(python-$_name)
pkgver=1.5
pkgrel=1
pkgdesc='A powerful financial data module used for pulling data from Yahoo Finance'
url='https://github.com/JECSand/yahoofinancials'
arch=('any')
license=('MIT')
depends=('python-requests' 'python-beautifulsoup4' 'python-pytz')
makedepends=('python-setuptools')
source=("https://github.com/JECSand/$_name/archive/$pkgver.tar.gz")
sha256sums=('372d30edbb25e6bd6fafa73bf915412b40522912cff14cba9ec28a50a3a105bd')

build(){
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
