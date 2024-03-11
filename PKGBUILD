# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Python module for the HiPack serialization format'
pkgname=python-hipack
_pkgname=hipack
pkgver=14
pkgrel=1
url='http://hipack.org'
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(GPL-3.0-only MIT)
arch=(any)
source=("https://github.com/aperezdc/hipack-python/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz")
b2sums=('88183f38f8fb7a97fb9870a8b742bdfbe648cc8a2ad9cfa785f2438e6376236608c544fb2887255153f05f4c30b55b374dfa3a237400768d8a34589a4fe30714')

build () {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package () {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
