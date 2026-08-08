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
sha256sums=('f32722f61a5cdcbfd2f7e01b54c82be75da783d35630686bef4b78dec632df6d')

build() {
    cd "$srcdir/folder-manager-py-$pkgver"
    # 이제 여기서 pyproject.toml이 보여야 합니다.
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/folder-manager-py-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
