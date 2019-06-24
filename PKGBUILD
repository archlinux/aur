# Maintainer: Nils Czernia <nils [at] czserver.de>

_pkgname=pyA20
pkgname=python-pya20
pkgver=0.2.12
pkgrel=1
pkgdesc="A python package for controling GPIO pins, I2C and SPI buses of The A20-OLinuXino-MICRO from Olimex"
url="https://www.olimex.com/wiki/A20-OLinuXino-MICRO"
license=("BSD")
arch=("armv7h")
source=("https://files.pythonhosted.org/packages/dd/c2/ec7b33d0aacd1037635a50c5b6d238453415de2fd417de13d5d1545cb6d8/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("4bef559a9c5a4d648d9834bad996cf2805b20d6063b8051029ffdf9deda2b536")

depends=("python>=3.1")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py build 
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
