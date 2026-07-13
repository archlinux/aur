# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-json-repair
pkgver=0.61.4
pkgrel=1
pkgdesc="Repair invalid JSON documents"
arch=('any')
url="https://github.com/joseph-bing/json-repair"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' )
depends=()

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/json-repair/json_repair-0.61.4.tar.gz")
sha256sums=('d78c212c1d72606bee30a7886820c9d6f7dbd659883dc2397304735a59f7bf86')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
