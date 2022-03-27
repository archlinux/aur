# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=gspread-pandas
pkgname=python-$_pkgname
pkgver=3.2.0
pkgrel=1
pkgdesc='Interacting with Google spreadsheets through Pandas DataFrames'
url="https://github.com/aiguofer/$_pkgname"
arch=('any')
license=('BSD')
depends=('python-gspread' 'python-pandas' 'python-decorator' 'python-future'
         'python-google-auth' 'python-google-auth-oauthlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f1d97b77abe7f371e31088f3e458a10fa1c66e97e09204eed0af1e4ba889013c')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
