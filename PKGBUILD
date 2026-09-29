# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname="python-$_name"
pkgver=2.6.3
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-build python-installer python-wheel python-hatch)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('1d5939c0f5f07e7f11c73511aa0c2246dd377df61725eadfe1afcd2af1a94e07')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
