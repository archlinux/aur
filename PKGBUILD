# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=gspread-pandas
pkgname=python-$_pkgname
pkgver=2.3.0
pkgrel=1
pkgdesc='A package to easily open an instance of a Google spreadsheet and interact with worksheets through Pandas DataFrames'
url="https://github.com/aiguofer/$_pkgname"
arch=('any')
license=('BSD')
depends=('python-gspread' 'python-pandas' 'python-decorator' 'python-future'
         'python-google-auth' 'python-google-auth-oauthlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('982cfc711b5c5a097f4e469a9e125619605c977d959dad4374fe616ee58574bc')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
