# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-slip10
pkgver=1.1.0
pkgrel=1
pkgdesc="A reference implementation of the SLIP-0010 specification, which generalizes the BIP-0032 derivation scheme for private and public key pairs in hierarchical deterministic wallets for the curves secp256k1, NIST P-256, ed25519 and curve25519."
arch=('any')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
url="https://github.com/trezor/python-slip10"
license=('BSD-3-Clause')
options=('!emptydirs')
source=(slip10-$pkgver.tar.gz::https://github.com/trezor/python-slip10/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('c25b90c694a37838b99fc7858bc0617584988e76b80b95caae00620afceb482d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
