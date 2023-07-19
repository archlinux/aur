# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
pkgname=python2-atomicwrites
_name=${pkgname//2/}
pkgver=1.4.1
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d2def28d0b90e61e15dd9590de991ba1b96d9232fc4fee990da088771d7320b9')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
