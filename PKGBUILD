pkgname=microcom
pkgver=2017.03.0
pkgrel=1
pkgdesc="terminal emulator"
arch=('x86_64')
license=('GPL')
url='http://git.pengutronix.de/?p=tools/microcom.git'
source=("git://git.pengutronix.de/git/tools/microcom.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make install DESTDIR="${pkgdir}"
}
