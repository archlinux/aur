# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=python-m2r
pkgver=0.2.1
pkgrel=1
pkgdesc="Markdown to reStructuredText converter"
arch=('any')
url="https://github.com/miyakogi/m2r"
license=('MIT')
depends=('python-mistune1' 'python-docutils')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9286c1a5d7548f34b0a12017444e4c441781bef4b71f321f723e314b76b6c498')

build() {
	cd "m2r-${pkgver}"
	python setup.py build
}

package() {
	cd "m2r-${pkgver}"
	python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=4 sw=4:
