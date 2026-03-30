# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Python module for the HiPack serialization format'
pkgname=python-hipack
_pkgname=hipack
pkgver=15
pkgrel=1
url='http://hipack.org'
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(GPL-3.0-only MIT)
arch=(any)
source=("https://github.com/aperezdc/hipack-python/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.lz")
b2sums=('574eef41fd76337bd8a11f4326bcd7f61c9c4c26c872b21d8a22e1cbd2a87aad5d4090807c2e1ad7e0f197486e3284567f174d3010e14e18dc28d73f40f60f67')

build () {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package () {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
