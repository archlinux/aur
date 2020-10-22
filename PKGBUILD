# Maintainer: Dudemanguy <random342@airmail.cc>

pkgname=s6-rc
pkgver=0.5.2.0
pkgrel=1
pkgdesc='A complete service manager for s6 systems.'
arch=('x86_64')
url='https://skarnet.org/software/s6-rc/'
license=('ISC')
depends=('skalibs' 'execline' 's6')
source=("https://skarnet.org/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1ab21a9bdde61b50e3d9deab867e01f808064dce653b0ebf8e5f5125d57cfee2')

build() {
 	cd ${pkgname}-${pkgver}
	./configure --exec-prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
