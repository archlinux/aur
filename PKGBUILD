# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=python-endesive
pkgver=2.19.1
pkgrel=1
pkgdesc="Python library for creating and validating PDF crypto signatures"
arch=('any')
url="https://github.com/m32/endesive"
license=('MIT')
depends=(
    'python'
    'python-cryptography'
    'python-pytz'
    'python-pillow'
    'python-pyopenssl'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.zip::$url/archive/refs/tags/v$pkgver.zip")
sha256sums=('0f8b6580753e270d4a5e19a485b27ce819858c6fd63f7ddbd7c487153884761a')

build() {
    cd "$srcdir/endesive-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/endesive-$pkgver"
    python -m installer --destdir "$pkgdir" dist/*.whl
}
