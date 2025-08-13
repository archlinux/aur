# Maintainer: casperrr
pkgname=pytermpix
pkgver=1.1.1
pkgrel=1
pkgdesc="Convert and display images as pixel art in an ANSI terminal"
arch=('any')
url="https://github.com/casperrr/termpix"
license=('MIT')
depends=('python' 'python-pillow' 'python-requests' 'python-validators')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/casperrr/termpix/archive/v$pkgver.tar.gz")
sha256sums=('99df55b6c163e7c6274e2b4885e52d85fb3297cae021ae0341cf38dfba02a718')

build() {
    cd "termpix-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "termpix-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
