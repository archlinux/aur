pkgname=amctl
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI for controlling system options and helpful tools."
arch=('any')
url="https://github.com/Hengtime787/Antimatter"
license=('MIT')
depends=('python' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "Antimatter-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "Antimatter-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
