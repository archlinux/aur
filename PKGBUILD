# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=python-xerox
pkgdesc='Simple copy+paste module for Python'
pkgver=0.4.1
pkgrel=3
url=https://github.com/kennethreitz/xerox
license=('custom:MIT')
arch=(any)
depends=(xclip python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=(39724b619d12af4447d88ba48e188b329a6cee8c82617a78b6074be40bb87775213e5c822f33d540c83cf104eb84a881d85eabec1b1233c7738f5c7f708a5791)

build () {
	cd "xerox-${pkgver}"
	python setup.py build
}

package () {
	cd "xerox-${pkgver}"
	python setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
