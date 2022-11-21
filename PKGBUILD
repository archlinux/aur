# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python38-pynacl
pkgver=1.4.0
pkgrel=5

pkgdesc='Python binding to the Networking and Cryptography (NaCl) library'
url='https://pypi.python.org/pypi/PyNaCl'
arch=('x86_64')
license=('Apache')

depends=('libsodium' 'python' 'python38-six' 'python38-cffi')
makedepends=('python38-setuptools' 'python38-pycparser' 'python38-wheel')

source=("https://pypi.org/packages/source/P/PyNaCl/PyNaCl-$pkgver.tar.gz")

sha512sums=('355b974010f94d551f631a2dd5ae792da3d4d0abf8ed70b6decc78aad24a9f965636988aebd14947b137ea14cdcbb73531775f08b1b4d5a9d72b5df3dba0b022')

build() {
	export SODIUM_INSTALL=system

	cd "$srcdir"/PyNaCl-$pkgver
	python3.8 setup.py build
}

package() {
	export SODIUM_INSTALL=system

	cd PyNaCl-$pkgver
	python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :
