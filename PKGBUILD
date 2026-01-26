# Maintainer: Asa-DB <gibthecat3@gmail.com>
pkgname=pkgwhy
pkgver=0.1.1
pkgrel=1
pkgdesc="A tool for idiots to remember why they installed a package"
arch=('any')
url="https://github.com/Asa-DB/pkgwhy"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('34a2ff85cb23c37a64fb9d8f39bd5c966d8e43b95a507ea45da2da24a1e051f3')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
