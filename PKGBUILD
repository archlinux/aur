# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname="python-$_name"
pkgver=2.6.1
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('39daaf6eb8e56528db2a1b9990f786b4cb87c6e6f2d7f97029429bb6e408e60e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
