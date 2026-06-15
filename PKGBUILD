# Maintainer: mark.blakeney at bullet-systems dot net
_name=portion
pkgname="python-$_name"
pkgver=2.6.2
pkgrel=1
pkgdesc='Python library providing data structure and operations for intervals'
url="https://github.com/AlexandreDecan/$_name"
license=(LGPL-3.0-or-later)
arch=(any)
depends=(python python-sortedcontainers)
makedepends=(python-build python-installer python-wheel python-hatch)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('2e25b37a3eb534c991db04c25b3db4863f3f1234756082647749116a0548d6bc')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
