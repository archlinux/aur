# Maintainer: kirarahoshiiii
pkgname=fpvtop
pkgver=0.1.0
pkgrel=1
pkgdesc="btop-style live terminal monitor for Betaflight flight controllers over MSP"
arch=('any')
url="https://github.com/kirarahoshiiii/fpvtop"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3ce251b9aa8cc11adf975e5b94843cbf2e484575ecdd1cece2f4fd9df6718d2')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
