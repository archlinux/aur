# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_name=QDigitalMeter
pkgname=python-qdigitalmeter
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple digital peak meter for PyQt'
arch=(any)
url=https://github.com/FrancescoCeruti/QDigitalMeter
license=(LGPL-2.1-or-later)
depends=(python python-qtpy)
makedepends=(python-build python-installer python-poetry-core)
source=("$_name-$pkgver.tar.gz::https://github.com/FrancescoCeruti/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03210a19d6353d2853245e58993f9473d5b702777a440d5424e0e239432cb751')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
