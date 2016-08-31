# Maintainer: Nils Czernia <nils [at] czserver.de>

_name=pyA20
pkgname=python-pya20
pkgver=0.2.1
pkgrel=1
pkgdesc="A python package for controling GPIO pins, I2C and SPI buses of The A20-OLinuXino-MICRO from Olimex"
url="https://www.olimex.com/wiki/A20-OLinuXino-MICRO"
license=('BSD')
arch=('armv7h')
source=("http://pypi.python.org/packages/source/p/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('b15e4ee1016b7eb52001cbccde3751868624a88d2adbb9adc5404628f7e59e7e')

depends=('python>=3.1')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build 
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
