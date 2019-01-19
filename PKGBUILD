# Maintainer: algebro <algebro at tuta dot io>

_pkgname=eth-typing
pkgname=python-$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc="Python types for type hinting commonly used Ethereum types."
arch=('x86_64')
url="https://github.com/ethereum/eth-typing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/ethereum/eth-typing/archive/v${pkgver}.tar.gz")
sha256sums=('d3de951ba92077f1610088b3902e42088f7d2142377e466b4520d7cfdad1375e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
