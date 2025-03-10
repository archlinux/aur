# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-slip10
_name=slip10
pkgver=1.0.1
pkgrel=1
pkgdesc="A reference implementation of the SLIP-0010 specification, which generalizes the BIP-0032 derivation scheme for private and public key pairs in hierarchical deterministic wallets for the curves secp256k1, NIST P-256, ed25519 and curve25519."
arch=('any')
depends=('python')
makedepends=()
url="https://github.com/trezor/python-slip10"
license=('BSD-3-Clause')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl)
sha256sums=('4aa764369db0a261e468160ec1afeeb2b22d26392dd118c49b9daa91f642947b')

package() {
  cd "$srcdir/$_name"
  python -m pip install --root="$pkgdir" --no-deps --prefix=/usr --root-user-action=ignore "$_name==$pkgver"
}
