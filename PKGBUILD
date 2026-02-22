# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Winux <winux@winux.it>

_pkgname=asyncer
pkgname=python-${_pkgname}
pkgdesc="Asyncer, async and await, focused on developer experience."

pkgver=0.0.17
pkgrel=1

arch=('any')
license=('MIT')

depends=('python' 'python-anyio' 'python-sniffio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')

url="https://github.com/tiangolo/asyncer"

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8f2d83f075e7ca06d77ef229d1ffaf228a17104349b02261684aed031abff4c1')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
