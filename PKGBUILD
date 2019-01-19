# Maintainer: algebro <algebro at tuta dot io>

_pkgname=pyevmasm
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=2
pkgdesc="Assembler and disassembler library for the Ethereum Virtual Machine (EVM)"
arch=('x86_64')
url="https://github.com/trailofbits/pyevmasm"
license=('Apache')
depends=('python' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trailofbits/pyevmasm/archive/${pkgver}.tar.gz")
sha256sums=('eb4f88476e4e405794f1238160ae293ba2c6b965d08fcf3efe0e369923430f7b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
