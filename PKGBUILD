# Maintainer: Your Name <your.email@example.com>
pkgname=optimizer
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line system optimizer for Arch Linux."
arch=('any')
url="https://github.com/bishnoipk01/cli-sys-optimizer"
license=('MIT')
depends=('python' 'python-click' 'python-psutil')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bishnoipk01/cli-sys-optimizer/releases/download/$pkgver/optimizer-$pkgver.tar.gz")
sha256sums=('5f1bf1f5d581c219b1f8798726d037099db737a41815a21beb8796734faea667')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
