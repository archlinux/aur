# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-json-repair
pkgver=0.61.5
pkgrel=1
pkgdesc="Repair invalid JSON documents"
arch=('any')
url="https://github.com/joseph-bing/json-repair"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' )
depends=()

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/json-repair/json_repair-0.61.5.tar.gz")
sha256sums=('965cc39a7cddc84aad0a1b00a4ce44906cf14893bd0e3890a386d28ca21dd0f0')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
