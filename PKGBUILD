
# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Lukas Miczka <lukascpu@gmail.com>

pkgname=gmpc-libnotify
pkgver=11.8.16
pkgrel=1
pkgdesc="Shows song change notification using your systems notification daemon. "
arch=(i686 x86_64)
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_LIBNOTIFY"
license="GPL"
depends=('libmpd>=11.8.16' 'libxml2' 'gmpc>=11.8.16' 'libnotify' 
'intltool')
source=(http://download.sarine.nl/Programs/gmpc/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f538e267ce3a0856e5029068108d4b0e')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
