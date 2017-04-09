# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=python-snap7
pkgver=0.8
pkgrel=1
pkgdesc="Step7 Open Source Ethernet Communication Suite"
url="http://snap7.sourceforge.net/"
license=("LGPL3")
arch=('x86_64')
source=("https://github.com/gijzelaerr/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('135943fa34fd688a710d25fd664afecdcef354c47964e018c306a94f658c75ec')

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
