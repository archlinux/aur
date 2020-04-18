# Maintainer: algebro <algebro at tuta dot io>

_pkgname=pyevmasm
pkgname=python-$_pkgname
pkgver=0.2.3
pkgrel=1
pkgdesc="Assembler and disassembler library for the Ethereum Virtual Machine (EVM)"
arch=('x86_64')
url="https://github.com/trailofbits/pyevmasm"
license=('Apache')
depends=('python' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trailofbits/pyevmasm/archive/${pkgver}.tar.gz")
sha256sums=('e05dc6f1691bfb9cac451fd59246f3f3f6c73b41fe07b97b5df1cadbe76b9789')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
