# Maintainer: Nils Czernia <nils [at] czserver.de>

_pkgname=pyA20
pkgname=python-pya20
pkgver=0.2.11
pkgrel=1
pkgdesc="A python package for controling GPIO pins, I2C and SPI buses of The A20-OLinuXino-MICRO from Olimex"
url="https://www.olimex.com/wiki/A20-OLinuXino-MICRO"
license=("BSD")
arch=("armv7h")
source=("https://pypi.python.org/packages/4c/a4/724ef69b2b618b99c57ce266f8f48a05401628c492c1960791c229cd7815/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("3e834683c07b2e6163fb8184e1409cb63fc34dca810cc7fac06a0ea7d12e574b")

depends=("python>=3.1")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build 
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
