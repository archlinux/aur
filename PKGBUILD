# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: GI Jack <gi_jack@hackermail.com>

pkgname=python-blue-loader
pkgver=0.1.54
pkgrel=3
pkgdesc="Python tools to communicate with Ledger Blue, Nano S and Nano X"
arch=('any')
url="https://github.com/LedgerHQ/blue-loader-python"
license=('Apache')
# missing: python-u2flib-host
depends=('python' 'python-hidapi' 'python-protobuf' 'python-pycryptodomex'
         'python-websocket-client' 'python-u2flib-host'
         'python-ecpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-scm')
optdepends=('python-pyscard: smartcard')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LedgerHQ/blue-loader-python/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('0f2c0158d0965cdc79ca7a1657fad7248086bffd7d21eaefc205f1a10132a9be')

build() {
    cd "blue-loader-python-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "blue-loader-python-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
