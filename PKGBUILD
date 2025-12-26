# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Winux <winux@winux.it>

_pkgname=asyncer
pkgname=python-${_pkgname}
pkgdesc="Asyncer, async and await, focused on developer experience."

pkgver=0.0.12
pkgrel=1

arch=('any')
license=('MIT')

depends=('python' 'python-anyio' 'python-sniffio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')

url="https://github.com/tiangolo/asyncer"

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ba6508ab9b52b0fd0980ac8be8e2c913afce20aa1ac6e9c8282560953e3bb6a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
