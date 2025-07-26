# Maintainer: gergi
pkgname=python-xknx
pkgver=3.8.0
pkgrel=1
pkgdesc="An Asynchronous Library for the KNX protocol"
arch=('any')
url="https://github.com/XKNX/xknx"
license=('MIT')
depends=('python>=3.10' 'python-cryptography' 'python-ifaddr')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-async-timeout: for Python < 3.11')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XKNX/xknx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('feaae741d4dd1c52765f77bbb51f1c5c70c858edd1592b4072070f19a2b35781')

build() {
    cd "$srcdir/xknx-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/xknx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
