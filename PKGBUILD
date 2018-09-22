# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-cllist
pkgver=1.1.0
pkgrel=2
pkgdesc="C-implemented linked-list module for Python"
arch=('i686' 'x86_64')
license=('MIT')
url="http://github.com/kata198/python-cllist"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/python-cllist/archive/${pkgver}.tar.gz")
sha512sums=("922ba867748fe9eeabfb37b159e63c9fb3ba6f67476e80d5c2a2a0e009d795693b6d9d55afe705d637eb4caa79648edd8e54e1ea6bf26748ac4598ca0beb0ee2")

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

