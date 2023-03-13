# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname=python-$_name
pkgver=2.4.0
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL3)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('d4eec292aa4277f7dba45d3f0f9e4927c5f27eeb334270c680e923a09f70adaf')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
