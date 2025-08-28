# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-wekan
pkgver=0.3.1
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://github.com/bastianwenske/python-wekan"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bastianwenske/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0e7be904c1cc79b1be5b565230b20516368ed60902597e95798779dcf0953e45')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
