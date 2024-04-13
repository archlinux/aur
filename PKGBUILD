# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=em-keyboard
pkgdesc='Command-line utility for referencing emoji characters by name'
pkgver=4.1.0
pkgrel=1
url=https://github.com/hugovk/em-keyboard
license=(MIT)
arch=(any)
depends=(python-docopt python-xerox python-wheel)
makedepends=(git python-build python-hatchling python-hatch-vcs python-installer python-wheel)
checkdepends=(python-tox)
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=(SKIP)

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
