# Maintainer: algebro <algebro at tuta dot io>

_pkgname=eth-utils
pkgname=python-$_pkgname
pkgver=1.8.4
pkgrel=1
pkgdesc="Utility functions for working with Ethereum related codebases."
arch=('x86_64')
url="https://github.com/ethereum/eth-utils"
license=('MIT')
depends=('python' 'python-eth-hash' 'python-eth-typing' 'python-toolz' 'python-cytoolz')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethereum/eth-utils/archive/v${pkgver}.tar.gz")
sha256sums=('46d20f5b2157ea60e5e91e1dc4cc70351e70345ee9644c2ba85e11f613222a06')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
