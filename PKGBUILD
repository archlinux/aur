# Maintainer: Dudemanguy <random342@airmail.cc>

pkgname=s6-rc
pkgver=0.5.2.2
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('skalibs>=2.10.0.0' 'execline>=2.7.0.0' 's6>=2.10.0.0')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a8d1cd455c05c8502b34517cfe79841aa46d08ad969076b37a15d3910617f89')

build() {
 	cd ${pkgname}-${pkgver}
	./configure --exec-prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
