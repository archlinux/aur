# Maintainer: algebro <algebro at tuta dot io>

_pkgname=eth-hash
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=1
pkgdesc="The Ethereum hashing function, keccak256, sometimes (erroneously) called sha256 or sha3."
arch=('x86_64')
url="https://github.com/ethereum/eth-hash"
license=('MIT')
depends=('python' 'python-pysha3' 'python-pycryptodome')
makedepends=('python-setuptools')
source=("https://github.com/ethereum/eth-hash/archive/v${pkgver}.tar.gz")
sha256sums=('4f275118ae0f26c9f3f7c9fc4feee308a9d32d04fd23b6c8ba25329d0e3da219')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
