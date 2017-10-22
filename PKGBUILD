# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=gp2c
pkgver=0.0.10.pl1
_pkgver=${pkgver/.pl/pl}
pkgrel=1
pkgdesc='Translates GP scripts to PARI programs'
url='http://pari.math.u-bordeaux.fr/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('pari')
makedepends=('perl')
source=("${url}pub/pari/GP2C/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('5bb12e3b57ed015f955a3639354f871840ef5e0f581c17fa30bbaefe77ab0f9a')

build() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--with-paricfg=/usr/lib/pari/pari.cfg \
		--with-perl \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	make DESTDIR="${pkgdir}" install
}
