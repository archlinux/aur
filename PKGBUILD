# Maintainer: algebro <algebro at tuta dot io>

_pkgname=pyevmasm
pkgname=python-$_pkgname
pkgver=0.2.0
pkgrel=1
pkgdesc="Assembler and disassembler library for the Ethereum Virtual Machine (EVM)"
arch=('x86_64')
url="https://github.com/trailofbits/pyevmasm"
license=('Apache License 2.0')
depends=('python' 'python-future')
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('777863b70d8595e2755e7743d448e2bddb9181ae295d33af55e99a36c0f3cc58')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
