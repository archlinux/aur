# Maintainer: algebro <algebro at tuta dot io>

_pkgname=pyevmasm
pkgname=python-$_pkgname
pkgver=0.2.2
pkgrel=1
pkgdesc="Assembler and disassembler library for the Ethereum Virtual Machine (EVM)"
arch=('x86_64')
url="https://github.com/trailofbits/pyevmasm"
license=('Apache')
depends=('python' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trailofbits/pyevmasm/archive/${pkgver}.tar.gz")
sha256sums=('bb68241feeebea07fb7cccef35caf1fa932219587ed84ee6fb2fe035750da66d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
