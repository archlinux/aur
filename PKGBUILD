# Maintainer: Your Name <your.email@example.com>
pkgname=cli_sys_optimizer
pkgver=0.1.0
pkgrel=1
pkgdesc="A command-line system optimizer for Arch Linux."
arch=('any')
url="https://github.com/bishnoipk01/cli-sys-optimizer"
license=('MIT')
depends=('python' 'python-click' 'python-psutil')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bishnoipk01/cli-sys-optimizer/releases/download/0.1.0/cli_sys_optimizer-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
