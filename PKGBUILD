# Maintainer: algebro <algebro at tuta dot io>

_pkgname=eth-typing
pkgname=python-$_pkgname
pkgver=2.2.1
pkgrel=1
pkgdesc="Python types for type hinting commonly used Ethereum types."
arch=('x86_64')
url="https://github.com/ethereum/eth-typing"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ethereum/eth-typing/archive/v${pkgver}.tar.gz")
sha256sums=('6c20477dbd8d2ccc482e8baec00dad129f768bb5d5282f1d1466a90a0e49001d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
