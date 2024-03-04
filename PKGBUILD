# Maintainer: a821 at mail dot de

pkgname=python-mpegdash
pkgver=0.4.0
pkgrel=1
pkgdesc="MPD (Media Presentation Description) parser"
url="https://github.com/sangwonl/python-mpegdash"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4128520c920d55906430a3540ca0b78db184554d1726bc91119f1fbc07aeb61a')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    python -m unittest discover
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
