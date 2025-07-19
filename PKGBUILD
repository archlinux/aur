# Maintainer: casperrr
pkgname=pytermpix
pkgver=1.0.2
pkgrel=1
pkgdesc="Convert and display images as pixel art in an ANSI terminal"
arch=('any')
url="https://github.com/casperrr/termpix"
license=('GNU')
depends=('python' 'python-pillow' 'python-requests' 'python-validators')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/casperrr/termpix/archive/v$pkgver.tar.gz")
# sha256sums=('b0248009114940d3f12b4df0c2126745a9182161756c2580da4675274320b4f2  v1.0.1.tar.gz')
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}