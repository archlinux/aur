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
sha256sums=('d71f8502051f8dac2cc8eb204627dd1f3c35450803c12f8eb107aa3d35115ee3')

build() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
