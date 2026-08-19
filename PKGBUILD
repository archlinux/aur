# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-wekan
pkgver=0.4.0
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://github.com/bastianwenske/python-wekan"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bastianwenske/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0c973d0473d648a5e1259b3064c0743a061edf69f20b07c24eacf04ee71f9023')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
