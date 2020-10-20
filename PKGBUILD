# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pkgname=pyexcel-io
pkgname=python-$_pkgname
pkgver=0.6.3
pkgrel=1
pkgdesc="A library to read and write data in csv, zipped csv and to/from databases"
arch=(any)
url="https://github.com/pyexcel/pyexcel-io"
license=('BSD-3-clause')
makedepends=('python-setuptools')
depends=('python-lml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dcb0c566b41e51e9ccef33c84856280d97ea3d4f3e07854f6fe4d875506a7105')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
