# Maintainer: Sematre <sematre at gmx dot de>
pkgname=python-iso639-lang
pkgver=2.0.0
pkgrel=1

pkgdesc="A lightweight library for the ISO 639 standard."
arch=('any')
url="https://github.com/LBeaudoux/iso639"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f98e00e5bc70bca842a62c3e34a721d1513676cbb6961ad9aacb2c4007e3e487')

build() {
	cd "iso639-${pkgver}"
	python setup.py build
}

package() {
	cd "iso639-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize 1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
