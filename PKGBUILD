# Maintainer: Sematre <sematre at gmx dot de>
pkgname=python-iso639-lang
pkgver=2.0.1
pkgrel=1

pkgdesc="A lightweight library for the ISO 639 standard."
arch=('any')
url="https://github.com/LBeaudoux/iso639"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab40ce1889ff812310d78b700f7d16167ff0144fe83b43455f1d0c1a4c723960')

build() {
	cd "iso639-${pkgver}"
	python setup.py build
}

package() {
	cd "iso639-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize 1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
