# Maintainer: sehraf
# submitter: vorpalblade77@gmail.com
pkgname=python-libusb1
_pkgname=libusb1
pkgver=1.6.6
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
sha256sums=('a5dc49ab094ec9a62a2ad1a8dd5d7a33f2a0d29c91e5b58f4c61d2f9add57ea2')

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
