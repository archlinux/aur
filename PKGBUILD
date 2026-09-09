# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=jsrc
pkgver=0.4.1
pkgrel=1
pkgdesc="Python library for bioinformatics and scientific computing"
arch=('any')
url="https://github.com/imjiaoyuan/jsrc"
license=('MIT')
depends=('python>=3.10' 'python-matplotlib>=3.5')
provides=("python-jsrc=$pkgver")
conflicts=('python-jsrc')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('259e3ed3529a57becbd803d07937582ac74238b05c22c434c001af60cde7beb5')

build() {
    cd "jsrc-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jsrc-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
