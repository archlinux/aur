# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-json-repair
pkgver=0.61.1
pkgrel=1
pkgdesc="Repair invalid JSON documents"
arch=('any')
url="https://github.com/joseph-bing/json-repair"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' )
depends=()

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/j/json-repair/json_repair-0.61.1.tar.gz")
sha256sums=('24a68de2891c696ad3bd9a94874e8d3ef2d309c56af2973094b8297c975b5b58')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
