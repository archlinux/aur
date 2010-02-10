# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: detto <detto-brumm@freenet.de>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-murrine
pkgver=0.90.3
pkgrel=1
pkgdesc="GTK2 engine to make your desktop look like a 'murrina', an italian word meaning the art glass works done by Venicians glass blowers."
arch=('i686' 'x86_64')
url="http://cimitan.com/murrine/project/murrine"
license=('GPL')
depends=('gtk2')
makedepends=('intltool' 'perl')
optdepends=('murrine-themes-collection: themes for Murrine engine')
options=('!libtool')
install=gtk-engine-murrine.install
source=(http://ftp.gnome.org/pub/GNOME/sources/murrine/0.90/murrine-${pkgver}.tar.bz2)
md5sums=('58a10b5c7b5e114a8a7ff5705fe274f5')

build() {
	cd ${srcdir}/murrine-${pkgver}

	./configure --prefix=/usr --enable-animation
	make || return 1
}

package() {
	cd ${srcdir}/murrine-${pkgver}

	make DESTDIR=${pkgdir} install
}
