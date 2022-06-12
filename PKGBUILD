# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-wcwidth
_name=${pkgname#python2-}
pkgver=0.2.5
pkgrel=6
pkgdesc='Library to measure the width of unicode strings in a terminal'
url='https://github.com/jquast/wcwidth'
license=('MIT')
arch=('any')
depends=('python2-backports.functools_lru_cache')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b08fa4c7d7be1ba86950c2d746eb0d19de80842ab7457df5b3fcd3bf52e02b08')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
