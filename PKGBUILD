# Maintainer: algebro <algebro at tuta dot io>
# Maintainer: kewl

_pkgname=eth-hash
pkgname=python-$_pkgname
pkgver=0.3.2
pkgrel=2
pkgdesc="The Ethereum hashing function, keccak256, sometimes (erroneously) called sha256 or sha3."
arch=('x86_64')
url="https://github.com/ethereum/eth-hash"
license=('MIT')
depends=('python' 'python-pysha3' 'python-pycryptodome')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethereum/eth-hash/archive/v${pkgver}.tar.gz")
sha256sums=('c3ea0bf417e0c227ad630e7a6905be85f26f92dcb5b48fd8f5584a3f77a08312')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
