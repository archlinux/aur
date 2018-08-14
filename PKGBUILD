# Maintainer: Philippe Hürlimann <p@hurlimann.org>
pkgname=python-ftfy
pkgver=5.3.0
pkgrel=1
pkgdesc='Fixes some problems with Unicode text after the fact'
url="https://github.com/LuminosoInsight/python-ftfy"
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-html5lib' 'python-wcwidth')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/LuminosoInsight/${pkgname}/archive/v${pkgver}.tar.gz)
sha384sums=('409e18c709dba9abee414c018085f95bba965b07e0accb8429222d2fb90b20e2c21e8032518e2d7b2b8ec58a362af1c5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}"
	install -Dm644 LICENSE.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
