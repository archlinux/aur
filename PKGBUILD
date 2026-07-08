# Maintainer: gergi
pkgname=python-xknx
pkgver=3.16.0
pkgrel=1
pkgdesc="An Asynchronous Library for the KNX protocol"
arch=('any')
url="https://github.com/XKNX/xknx"
license=('MIT')
depends=('python>=3.10' 'python-cryptography' 'python-ifaddr')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-async-timeout: for Python < 3.11'
            'python-typing_extensions: for Python < 3.11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XKNX/xknx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8fad8c5b0829ce76db6686f7bf74dc8b8d33b1e360a260bf41f8193a2a6266f2')

build() {
    cd "$srcdir/xknx-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xknx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
