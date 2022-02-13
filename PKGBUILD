# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=gspread-pandas
pkgname=python-$_pkgname
pkgver=3.0.4
pkgrel=1
pkgdesc='Interacting with Google spreadsheets through Pandas DataFrames'
url="https://github.com/aiguofer/$_pkgname"
arch=('any')
license=('BSD')
depends=('python-gspread' 'python-pandas' 'python-decorator' 'python-future'
         'python-google-auth' 'python-google-auth-oauthlib')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d7baf8b37dc34fe061aaaa8400db6307aeed6abea992106c2ef7450b3a92e70')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
