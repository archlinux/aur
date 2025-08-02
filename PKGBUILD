pkgname=pastebincli
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line interface to Pastebin"
arch=('any')
url="https://github.com/CoolSoulz/pastebincli"
license=('GPL')
depends=('python' 'python-requests' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # optional: replace with real hash

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
