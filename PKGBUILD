# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-wekan
pkgver=0.3.2
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://github.com/bastianwenske/python-wekan"
arch=(any)
license=('BSD-3-Clause')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'cython' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bastianwenske/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4bd64f8eb3d51d581441c6d00523d54fd1b407ead8dd347615b5b86ad1415779')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
