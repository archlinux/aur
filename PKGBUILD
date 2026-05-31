# Maintainer: Petr Kracik <petrkr@petrkr.net>

pkgname=mpremote
pkgver=1.28.0
pkgrel=1
pkgdesc="This CLI tool provides an integrated set of utilities to remotely interact with and automate a MicroPython device over a serial connection"
arch=('any')
url="https://docs.micropython.org/en/latest/reference/mpremote.html"
license=('MIT')
depends=(
	'python-pyserial'
	'python-platformdirs'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-hatchling'
	'python-hatch-vcs'
	'python-hatch-requirements-txt'
)

source=("https://files.pythonhosted.org/packages/source/m/mpremote/mpremote-${pkgver}.tar.gz")
sha256sums=('fdb5626be83dff4e53c0184f8950814cb519b524dba7f1f8b1668aa477257a31')

build() {
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
