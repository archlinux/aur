# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=em-keyboard
pkgdesc='Command-line utility for referencing emoji characters by name'
pkgver=5.3.0
pkgrel=1
url=https://github.com/hugovk/em-keyboard
license=(MIT)
arch=(any)
depends=(python-docopt python-xerox python-wheel)
makedepends=(git python-build python-hatchling python-hatch-vcs python-installer python-wheel)
checkdepends=(python-tox)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('3021c29a5978f8226ad043180028927a9d4343162ac099e16a2fd7c9b60fb53f798740ef1c29545af343d4a1cf9f9d5e704c5fcf2d50208838daf146fc4a6149')

build () {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check () {
	cd "$pkgname"
	tox
}

package () {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
