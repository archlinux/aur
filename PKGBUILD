# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gsieve
pkgver=0.2
pkgrel=2
pkgdesc='Sieve script editor for Gnome, easy to use.'
arch=('i686' 'x86_64')
url='http://gsieve.sourceforge.net/'
license=('GPL')
depends=('gnome-python')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ac0fa9406ef1bc7c7f4421ec38a87fb4566388da5bdc50163b3b0b401b197f81')

build () {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install
}

