# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pkgname=pyexcel-io
pkgname=python-$_pkgname
pkgver=0.6.4
pkgrel=1
pkgdesc="A library to read and write data in csv, zipped csv and to/from databases"
arch=(any)
url="https://github.com/pyexcel/pyexcel-io"
license=('BSD-3-clause')
makedepends=('python-setuptools')
depends=('python-lml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('45329cd13a5107a9c6b2a0c047de6df944a05936cd47d3ec4158f9aefcde0a2f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
