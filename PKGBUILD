# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Winux <winux@winux.it>

_pkgname=asyncer
pkgname=python-${_pkgname}
pkgdesc="Asyncer, async and await, focused on developer experience."

pkgver=0.0.13
pkgrel=1

arch=('any')
license=('MIT')

depends=('python' 'python-anyio' 'python-sniffio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')

url="https://github.com/tiangolo/asyncer"

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('438eaf691f082e6c30aaa60e3540f9e968ce6f01e0827d63241a1b2a92934235')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
