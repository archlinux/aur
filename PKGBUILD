# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
pkgname=python2-atomicwrites
_name=${pkgname//2/}
pkgver=1.4.0
pkgrel=7
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('47e897bea4ffdd4c0bc5f95b9417c1b4a661671b8a5abbefa05fbb344e83296e')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
