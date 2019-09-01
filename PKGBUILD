# Maintainer: sehraf
# submitter: vorpalblade77@gmail.com
pkgname=python-libusb1
_pkgname=libusb1
pkgver=1.7.1
pkgrel=1
pkgdesc="Pure python wrapper for libusb"
arch=('any')
url="https://github.com/vpelletier/${pkgname}"
license=('GPL2')
makedepends=('git' 'python-distutils-extra' 'python-setuptools')
depends=('python' 'libusbx')
optdepends=()
conflicts=("${pkgname}-git")
changelog='changelog.txt'
source=("https://github.com/vpelletier/python-libusb1/archive/${pkgver}.tar.gz")
sha256sums=('b7e44533f3430540107d6f0ab555357f4060b105f30ecfed6e107d4d7f8f1306')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
}
