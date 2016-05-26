# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=python2-libusb1
_pkgname=libusb1
pkgver=1.5.0
pkgrel=1
pkgdesc="Pure python wrapper for libusb"
arch=('any')
url="https://github.com/vpelletier/${pkgname}"
license=('GPL2')
makedepends=('git' 'python2-distutils-extra' 'python2-setuptools')
depends=('python2' 'libusbx')
optdepends=()
conflicts=("${pkgname}-git")
source=("git+https://github.com/vpelletier/python-libusb1.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/python-libusb1"
	python2 setup.py build
}

package() {
	cd "${srcdir}/python-libusb1"
	python2 setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
}
