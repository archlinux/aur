# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Winux <winux@winux.it>

_pkgauthor=fastapi
_pkgname=asyncer
pkgname=python-${_pkgname}
pkgdesc="Asyncer, async and await, focused on developer experience."

pkgver=0.0.18
pkgrel=1

arch=('any')
license=('MIT')

depends=('python' 'python-anyio' 'python-sniffio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')

url="https://github.com/${_pkgauthor}/${_pkgname}"

source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('98f4fb7e9f978c84ea17e983bdaa5d2f200d23e3555075827e6b7fc295df7217')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
