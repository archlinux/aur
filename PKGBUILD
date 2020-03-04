# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=gspread-pandas
pkgname=python-$_pkgname
pkgver=2.2.1
pkgrel=1
pkgdesc='A package to easily open an instance of a Google spreadsheet and interact with worksheets through Pandas DataFrames'
url="https://github.com/aiguofer/$_pkgname"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9890daf48795803f166afed0b9b66d7f8d95da36b6180187cb04736b2022b6cd')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
