# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=1.3
pkgrel=1
pkgdesc="ctypes based python wrapper for snap7"
url="https://github.com/gijzelaerr/python-snap7"
license=("LGPL3")
arch=("any")
depends=("snap7" "python")
makedepends=("python-setuptools")
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0636464c0613203cacb1f96a2eec6aed23758a375c24fa124bcaf242a45cbd6b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
