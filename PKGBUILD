# Maintainer: Yigit Sever <yigit at yigitsever dot com>
pkgname=python-extruct
_pkgname=extruct
pkgver=0.13.0
pkgrel=1
pkgdesc="Extract embedded metadata from HTML markup"
arch=('any')
url="https://github.com/scrapinghub/extruct"
license=('custom')
depends=('python-lxml' 'python-requests' 'python-rdflib' 'python-rdflib-jsonld' 'python-pyrdfa3' 'python-mf2py' 'python-six' 'python-w3lib' 'python-html-text' 'python-jstyleson')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2bf4d8aaf9cfd2ea27bac256e5cabd601a480a47f49b9531ac8bfe3b42a9c74f')

build() {
	cd "${_pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
