# Maintainer: Edward Amor <edward.amor3 at gmail dot com>
pkgname=python-vyper-git
pkgver=0.2.11
pkgrel=2
pkgdesc="Pythonic Smart Contract Language for the EVM"
arch=('x86_64')
url="https://github.com/vyperlang/vyper"
license=('Apache-2.0')
depends=('python' 'python-asttokens' 'python-pycryptodome' 'python-semantic-version' 'python-setuptools')
makedepends=('git' 'python-setuptools')
provides=('vyper' 'vyper-serve' 'vyper-lll' 'vyper-json')
source=('git+https://github.com/vyperlang/vyper.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/vyper"
	git checkout v0.2.11
	python setup.py build
}

package() {
	cd "$srcdir/vyper"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
