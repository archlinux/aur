# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=python-pyxtermjs
pkgver=0.5.0.2
pkgrel=1
pkgdesc='Fully functional terminal in your browser.'
url='https://github.com/cs01/pyxtermjs'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
arch=('any')
sha256sums=('3d90e9dac9691f183d6aa4d6d4d20daafa56a81e53893db5d2f0c667f88e9a83')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="pyxtermjs-${pkgver}"

build() {
	cd "${_srcdir}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=('python-socketio' 'python-flask' 'python-flask-socketio' 'python-markupsafe')

	cd "${_srcdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
