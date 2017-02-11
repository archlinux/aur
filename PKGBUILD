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
source=("git+https://github.com/vpelletier/${pkgname}.git")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="${pkgdir}" \
	--prefix="/usr" \
	--compile -O1
}
