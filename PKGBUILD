# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Winux <winux@winux.it>

_pkgname=asyncer
pkgname=python-${_pkgname}
pkgdesc="Asyncer, async and await, focused on developer experience."

pkgver=0.0.15
pkgrel=1

arch=('any')
license=('MIT')

depends=('python' 'python-anyio' 'python-sniffio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')

url="https://github.com/tiangolo/asyncer"

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('15368daa19366537e4c479e25e14b6c753d9c2b7b3a16e2937b3510bbc03b03e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
