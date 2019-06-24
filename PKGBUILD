# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=0.10
pkgrel=4
pkgdesc="This is a ctypes based python wrapper for snap7"
url="http://snap7.sourceforge.net/"
license=("LGPL3")
arch=('any')
depends=("snap7" "python")
makedepends=("python-setuptools")
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d5909496234da914d553c9f5a8d6d5ef7ac83d87fe1ec492bcdd91549a7993d2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python ./setup.py install --prefix=/usr --root="${pkgdir}"

#	install -dm755 "${pkgdir}/usr/lib"
#	install -dm755 "${pkgdir}/usr/include"

#	cp -a bin/x86_64-linux/libsnap7.so "${pkgdir}/usr/lib/"
}
