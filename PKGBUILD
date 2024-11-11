# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname="python-$_name"
pkgver=2.6.0
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('03cfca9d6cde7e4d382b567267ebd8a758f9d1bc80393bc30fcd1224093fe95f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
