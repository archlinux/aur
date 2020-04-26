# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=gspread-pandas
pkgname=python-$_pkgname
pkgver=2.2.3
pkgrel=1
pkgdesc='A package to easily open an instance of a Google spreadsheet and interact with worksheets through Pandas DataFrames'
url="https://github.com/aiguofer/$_pkgname"
arch=('any')
license=('BSD')
depends=('python-gspread' 'python-pandas' 'python-decorator' 'python-future'
         'python-google-auth' 'python-google-auth-oauthlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('09910b49ac07a008c5deceec642c0efa7de84c1a247b6c0e273287bc0fae29f2')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
