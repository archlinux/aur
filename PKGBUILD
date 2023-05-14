# Maintainer: GI Jack <gi_jack@hackermail.com>

pkgname=python-blue-loader
pkgver=0.1.47
pkgrel=1
pkgdesc="Python tools to communicate with Ledger Blue, Nano S and Nano X"
arch=('any')
url="https://github.com/LedgerHQ/blue-loader-python"
license=('Apache')
# missing: python-u2flib-host
depends=('python' 'python-hidapi' 'python-protobuf' 'python-pycryptodomex'
         'python-future' 'python-pillow' 'python-websocket-client' 'python-u2flib-host'
         'python-ecpy')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-pyscard: smartcard')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LedgerHQ/blue-loader-python/archive/${pkgver}.tar.gz")
sha256sums=('72b89018b81675a49323e97663928dffd5ce133dc2ae2a1e888100e2bb2b318d')

build() {
    cd "blue-loader-python-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "blue-loader-python-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
