# Maintainer: kirarahoshiiii
pkgname=fpvtop
pkgver=0.1.1
pkgrel=1
pkgdesc="btop-style live terminal monitor for Betaflight flight controllers over MSP"
arch=('any')
url="https://github.com/kirarahoshiiii/fpvtop"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f968acbd4f071f46ff69ead7a41364449bc2dcdf930541c49577c9fca36cc840')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
