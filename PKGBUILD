# Maintainer: Dudemanguy <random342@airmail.cc>

pkgname=s6-linux-init
pkgver=1.0.2.1
pkgrel=1
pkgdesc='A tool to automate the creation of suitable stage 1 init binaries for s6-based Linux systems. For Artix Linux.'
arch=('x86_64')
url='https://skarnet.org/software/s6-linux-init/'
license=('ISC')
install=s6-linux-init.install
depends=('skalibs' 'execline' 's6' 's6-rc' 'runit-rc')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d29b1e8858cb1335f801fc5195353fd57629f36a2afa9dda00f650ae08ead267')

build() {
 	cd ${pkgname}-${pkgver}
	./configure --exec-prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
