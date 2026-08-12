# Maintainer: Michelle <michellejang1972@gmail.com>
pkgname=folder-manager-py
pkgver=0.3.8
pkgrel=2
pkgdesc="A number-based folder management and auto-alignment tool"
arch=('any')
url="https://github.com/jang1972/folder-manager-py"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jang1972/folder-manager-py/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9999872ca03fba9cdd9dcd1eee6e60dc96ca994c4d67bee6498ddab5ef607c2a')

build() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
