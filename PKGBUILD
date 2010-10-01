# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: detto <detto-brumm@freenet.de>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-engine-murrine
pkgver=0.98.1
pkgrel=1
pkgdesc="GTK2 engine to make your desktop look like a 'murrina', an italian word meaning the art glass works done by Venicians glass blowers."
arch=('i686' 'x86_64')
url="http://cimitan.com/murrine/project/murrine"
license=('LGPL3')
depends=('gtk2>=2.22')
makedepends=('intltool')
optdepends=('murrine-themes-collection: themes for Murrine engine')
options=('!libtool')
install=gtk-engine-murrine.install
source=(http://ftp.gnome.org/pub/GNOME/sources/murrine/0.98/murrine-${pkgver}.tar.bz2)
sha256sums=('37f4f2d723ce6a03dc1654a142e2477b8d3d23ebb5d7af2f2c85ae72f53d87ae')

build() {
	cd ${srcdir}/murrine-${pkgver}

	./configure --prefix=/usr --enable-animation --enable-animationrtl
	make
}

package() {
	cd ${srcdir}/murrine-${pkgver}

	make DESTDIR=${pkgdir} install
}
