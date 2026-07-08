# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-json-repair
pkgver=0.61.2
pkgrel=1
pkgdesc="Repair invalid JSON documents"
arch=('any')
url="https://github.com/joseph-bing/json-repair"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' )
depends=()

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/json-repair/json_repair-0.61.2.tar.gz")
sha256sums=('b63ae5ad44c8720158e24bdd7e33506f7036174c287831b187a51619a6f58a34')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
