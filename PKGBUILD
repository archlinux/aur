# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=gp2c
pkgver=0.0.10
pkgrel=1
pkgdesc='Translates GP scripts to PARI programs'
url='http://pari.math.u-bordeaux.fr/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('pari')
makedepends=('perl')
source=("${url}pub/pari/GP2C/$pkgname-${pkgver}.tar.gz")
sha1sums=('6bce2bbb69227de44fa768619d1dffa861d6470a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--with-paricfg=/usr/lib/pari/pari.cfg \
		--with-perl \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
