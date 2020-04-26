# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=0.11
pkgrel=1
pkgdesc="ctypes based python wrapper for snap7"
url="https://github.com/gijzelaerr/python-snap7"
license=("LGPL3")
arch=("any")
depends=("snap7" "python")
makedepends=("python-setuptools")
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("287a3130dc40b61d532d82f8ae0b99478fa0132c00d050f990ed536449a83473")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
