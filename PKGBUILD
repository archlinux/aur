# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname=python-$_name
pkgver=2.4.1
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL3)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('1c72e41f8dcc93f14c626b9dbd6aea805c84ba10aaea8b6439b2ddfb28bbfe94')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
