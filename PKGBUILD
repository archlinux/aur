# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=gp2c
pkgver=0.0.9pl3
pkgrel=1
pkgdesc='Translates GP scripts to PARI programs'
url='http://pari.math.u-bordeaux.fr/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('pari')
makedepends=('perl')
source=("${url}pub/pari/GP2C/$pkgname-${pkgver}.tar.gz")
md5sums=('cb263990e399153aca6a2540930b4600')

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
