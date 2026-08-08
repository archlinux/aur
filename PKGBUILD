# Maintainer: Michelle <michellejang1972@gmail.com>
pkgname=folder-manager-py
pkgver=0.3.8
pkgrel=1
pkgdesc="A number-based folder management and auto-alignment tool"
arch=('any')
url="https://github.com/jang1972/folder-manager-py"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jang1972/folder-manager-py/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4acbdec759c83dc2a6fc3dd4cbf62e4ecf1c6a8ee4dcc6a4a67484e2369cd22a')

build() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
