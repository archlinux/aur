# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=python-cllist
pkgver=1.0.2
pkgrel=1
pkgdesc="C-implemented linked-list module for Python"
arch=('i686' 'x86_64')
license=('MIT')
url="http://github.com/kata198/python-cllist"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')
source=("https://github.com/kata198/python-cllist/archive/${pkgver}.tar.gz")
sha512sums=("0595dc5e24cb08f58b52977f62694ecbee25d9f8d9bce741cbb1c488508ca012bbf2c2c37e5d83b7d271264e01aacab1916fc585a92034c13f221d55d5ca9865")

build() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

