# Maintainer: Michelle <michellejang1972@gmail.com>
pkgname=folder-manager-py
pkgver=0.3.6
pkgrel=1
pkgdesc="A number-based folder management and auto-alignment tool"
arch=('any')
url="https://github.com/jang1972/folder-manager-py"
license=('GPL3')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jang1972/folder-manager-py/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60d53a736b3ad4e1b1c231bd59b67d7de7368118b6a094742c09ca8dc0f4f518')

build() {
    cd "$srcdir/folder-manager-py-$pkgver"
    # 이제 여기서 pyproject.toml이 보여야 합니다.
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
