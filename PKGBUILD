# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=udpcast
pkgver=20200328
pkgrel=2
pkgdesc="Network multicasting tool"
arch=('i686' 'x86_64')
url="http://udpcast.linux.lu/"
license=('GPL')
source=("http://udpcast.linux.lu/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9c19eebaa6e2f78127f0d59e95d0ce003b687d61e283b5963a1da6b8ac41f21a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# install to /usr/bin
	sed -i 's/sbin/bin/g' Makefile.in

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

