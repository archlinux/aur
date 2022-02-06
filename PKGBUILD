# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=1.1
pkgrel=1
pkgdesc="ctypes based python wrapper for snap7"
url="https://github.com/gijzelaerr/python-snap7"
license=("LGPL3")
arch=("any")
depends=("snap7" "python")
makedepends=("python-setuptools")
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c284b8773f1ba96e576a163a22b572a87f7534bd949ccc903aba2751e459971b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py install --prefix=/usr --root="${pkgdir}"
}
