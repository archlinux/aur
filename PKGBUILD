# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=python2-librouteros
_pkgname=librouteros
pkgver=2.2.0
pkgrel=1
pkgdesc="C library to communicate with network devices by MikroTik running their Linux-based operating system RouterOS."
url="https://github.com/octo/librouteros"
arch=("i686" "x86_64" "armv7h")
license=("ISC")
depends=("gcc-libs" "python2" "python2-setuptools")
source=("https://github.com/luqasz/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("cf5d390e8fe6bd178ad75e787da0320b187960dd9a876d0d4342be5ef9c0d7f1")
conflicts=("${_pkgname}-git")

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}"
}
