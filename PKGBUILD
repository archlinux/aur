# Maintainer: Petr Kracik <petrkr@petrkr.net>

pkgname=mpremote
pkgver=1.26.1
pkgrel=1
pkgdesc="This CLI tool provides an integrated set of utilities to remotely interact with and automate a MicroPython device over a serial connection"
arch=('any')
url="https://docs.micropython.org/en/latest/reference/mpremote.html"
license=('MIT')
depends=(
	'python-pyserial'
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
sha256sums=('61a39bf5af502e1ec56d1b28bf067766c3a0daea9d7487934cb472e378a12fe1')

build() {
	cd $pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
