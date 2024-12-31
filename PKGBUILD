# Contributor: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=gspread-pandas
pkgname=python-$_pkgname
pkgver=3.3.0
pkgrel=1
pkgdesc='Interacting with Google spreadsheets through Pandas DataFrames'
url="https://github.com/aiguofer/$_pkgname"
arch=('any')
license=('BSD')
depends=('python-gspread' 'python-pandas' 'python' 'python-requests'
         'python-google-auth' 'python-google-auth-oauthlib' 'python-numpy')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f3e404c5e1ae87638a021c9aab54a5bff36f6b05dac3d0b07b49be42d760421')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
