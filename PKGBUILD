# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=0.10
pkgrel=5
pkgdesc="ctypes based python wrapper for snap7"
url="https://github.com/gijzelaerr/python-snap7"
license=("LGPL3")
arch=("any")
depends=("snap7" "python")
makedepends=("python-setuptools")
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("d5909496234da914d553c9f5a8d6d5ef7ac83d87fe1ec492bcdd91549a7993d2")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
