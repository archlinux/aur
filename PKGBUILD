# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pyexcel-xlsx
pkgname=python-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc='A wrapper library to read, manipulate and write data in xlsx and xlsm format using openpyxl'
url="https://github.com/pyexcel/$_pkgname"
arch=('any')
license=('MIT')
depends=('python-openpyxl' 'python-pyexcel-io')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9fc3a45d0cac5a5411e5bb4ce7a48f1af0709a14a8621a92b0d005aaeb48526e')

build(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
