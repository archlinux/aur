# Maintainer: Sematre <sematre at gmx dot de>
pkgname=python-iso639-lang
pkgver=2.1.0
pkgrel=1

pkgdesc="A lightweight library for the ISO 639 standard."
arch=('any')
url="https://github.com/LBeaudoux/iso639"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ffe80b13adb336687925ec1d6e46749f3a82e289d998e58eb2350b3fb79e486')

build() {
	cd "iso639-${pkgver}"
	python setup.py build
}

package() {
	cd "iso639-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize 1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
