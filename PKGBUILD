# Maintainer: vorpalblade77@gmail.com
pkgname=python-libusb1
_pkgname=libusb1
pkgver=1.6.4
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
md5sums=('448cf619d6f2d9481fe39a5e0496b877')

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
