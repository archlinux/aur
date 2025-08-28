# Maintainer: Martin Rys <https://rys.rs/contact>
pkgname=python-flask-httpauth
pkgver=4.8.0
pkgrel=2
pkgdesc="Basic and Digest HTTP authentication for Flask routes"
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-build' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miguelgrinberg/Flask-HTTPAuth/archive/v${pkgver}.tar.gz")

sha256sums=('1984f9ef025482d06a19f6d4ad6852095fe7602e97c59511070f9c4e4652cb9e')

build() {
	cd "${srcdir}/Flask-HTTPAuth-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/Flask-HTTPAuth-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
