# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>

pkgname=python-oset
pkgver=0.1.3
pkgrel=9
pkgdesc="Ordered sets for Python"
arch=('any')
url="https://pypi.org/project/oset/"
license=('BSD')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/o/oset/oset-$pkgver.tar.gz")
sha256sums=('4c1fd7dec96eeff9d3260995a8e37f9f415d0bdb79975f57824e68716ac8f904')

build() {
  cd "$srcdir/oset-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/oset-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
