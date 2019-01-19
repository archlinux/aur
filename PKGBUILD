# Maintainer: algebro <algebro at tuta dot io>

_pkgname=eth-utils
pkgname=python-$_pkgname
pkgver=1.4.1
pkgrel=3
pkgdesc="Utility functions for working with Ethereum related codebases."
arch=('x86_64')
url="https://github.com/ethereum/eth-utils"
license=('MIT')
depends=('python' 'python-eth-hash' 'python-eth-typing' 'python-toolz' 'python-cytoolz')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethereum/eth-utils/archive/v${pkgver}.tar.gz")
sha256sums=('71113fc420bc6c3fbe144f96a7a5298e5d2a9b56ce8b8e563b09f6d7f209bde5')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
