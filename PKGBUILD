# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pkgname=pyexcel-io
pkgname=python-$_pkgname
pkgver=0.6.6
pkgrel=1
pkgdesc="A library to read and write data in csv, zipped csv and to/from databases"
arch=(any)
url="https://github.com/pyexcel/pyexcel-io"
license=('BSD')
makedepends=('python-setuptools')
depends=('python-lml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbe727da2caa6e5f7653f574a762a92ae59e39d2cc0498cec4d49ad2319bc1ab')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
