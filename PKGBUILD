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
sha256sums=('4f7156d7f50d58e8c8cfc78bc97f269e1cf67580cf8ac57ad9ec27e3de699e23')

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
