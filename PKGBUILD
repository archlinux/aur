# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Germán Osella Massa <gosella@gmail.com>
pkgname=python2-more-itertools
_name=${pkgname#python2-}
pkgver=5.0.0
pkgrel=3
pkgdesc='More routines for operating on iterables, beyond itertools'
arch=('any')
url='https://github.com/more-itertools/more-itertools'
license=('MIT')
depends=('python2-six')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a2dd59cdb7287d738b3c745558f0812b69b519cda21726b180b09d9d68d8b461')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m unittest discover
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
