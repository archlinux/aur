# Maintainer: SanskritFritz (gmail)

pkgname=xfce4-embed-plugin
pkgver=1.4.1
pkgrel=1
pkgdesc="Plugin that enables embedding of any application window into the Xfce panel."
arch=('i686' 'x86_64')
license=('GPL')
url="http://goodies.xfce.org/projects/panel-plugins/${pkgname}"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
#options=('!libtool')
source=(http://archive.xfce.org/src/panel-plugins/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.bz2)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--disable-debug
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
md5sums=('6d1021c0af861241d73971085cde5e52')

