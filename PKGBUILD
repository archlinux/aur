# Maintainer: Dudemanguy <random342@airmail.cc>

pkgname=s6-rc
pkgver=0.5.0.0
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('skalibs' 'execline' 's6')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cb7f033965a6c1b6f500cbb7a2f3ecdf2310fbb18f79e7a2a384541413b9275d')

build() {
 	cd ${pkgname}-${pkgver}
	./configure --exec-prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
