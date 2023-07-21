# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-extruct
_pkgname=extruct
pkgver=0.16.0
pkgrel=1
pkgdesc="Extract embedded metadata from HTML markup"
arch=('any')
url="https://github.com/scrapinghub/extruct"
license=('custom')
depends=('python-lxml' 'python-requests' 'python-rdflib' 'python-pyrdfa3' 'python-mf2py' 'python-six' 'python-w3lib' 'python-html-text' 'python-jstyleson')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9ad821c0f87ce8096d72753e5cbdfbace72569aef298b0ee9b2a46ecb9bc46f3')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
