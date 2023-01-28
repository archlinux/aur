# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname=python-$_name
pkgver=2.3.1
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL3)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('50a676c1fbb3b6d54960b521c22f3b9dab4eda41528704687dac5bf2321e4378')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
