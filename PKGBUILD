# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-m2r
pkgver=0.3.1
pkgrel=1
pkgdesc="Markdown to reStructuredText converter."
arch=('any')
url="https://github.com/miyakogi/m2r"
license=('MIT')
depends=('python-mistune1' 'python-docutils')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('db99105d3b43121ca31d543f561a2078c00d0b9d9d6a7062b64ca5d084a74288')

build() {
	cd "m2r-${pkgver}"
	python setup.py build
}

package() {
	cd "m2r-${pkgver}"
	python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=4 sw=4 et:
