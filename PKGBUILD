# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-wekan
pkgver=0.2.1
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://github.com/bastianwenske/python-wekan"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bastianwenske/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7d983af4cf638a5c9bab182ab66b2224473e8ed8ccfd55a528695f9ac469c433')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
