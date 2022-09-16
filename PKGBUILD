# Maintainer: Phil Schaf <flying-sheep@web.de>

_name=aiomanhole
pkgname=python-$_name
pkgver=0.7.0
pkgrel=2
pkgdesc='Manhole for accessing asyncio applications'
url="https://github.com/nathan-hoad/$_name"
arch=(any)
license=(Apache)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bf22b6ca4190cb35c9cdc94e4be31190353fdc320e1b346c032d0d47fc3ca453')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
