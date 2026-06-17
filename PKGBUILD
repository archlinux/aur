# Maintainer: Martin Rys <https://rys.rs/contact>
pkgname=python-flask-httpauth
pkgver=4.8.1
pkgrel=1
pkgdesc="Basic and Digest HTTP authentication for Flask routes"
url="https://github.com/miguelgrinberg/Flask-HTTPAuth"
license=('MIT')
arch=('any')
depends=('python' 'python-flask')
makedepends=('python-build' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miguelgrinberg/Flask-HTTPAuth/archive/v${pkgver}.tar.gz")

sha256sums=('ed90212959030a99f64543b08b58db3a3089bc3f6a098e01f4a70186ca1f580a')

build() {
	cd "${srcdir}/Flask-HTTPAuth-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/Flask-HTTPAuth-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
