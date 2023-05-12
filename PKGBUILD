# Maintainer: Petr Kracik <petrkr@petrkr.net>

pkgname=mpremote
pkgver=1.20.0
pkgrel=1
pkgdesc="This CLI tool provides an integrated set of utilities to remotely interact with and automate a MicroPython device over a serial connection"
arch=('any')
url="https://github.com/micropython/micropython/tools/mpremote"
license=('MIT')
depends=(
	'python-pyserial'
)
makedepends=(
	'python-pip'
	'python-installer'
)

build() {
	cd "${srcdir}"
	/usr/bin/pip3 download --no-deps $pkgname==$pkgver
}

package() {
	/usr/bin/python3 -m installer --destdir="$pkgdir" ${srcdir}/*.whl
}
