# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.1.0
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/solus-project/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('gtk3' 'mate-panel')
makedepends=('gnome-common')
source=("https://github.com/solus-project/brisk-menu/releases/download/v0.1.0/brisk-menu-${pkgver}.tar.xz")
md5sums=('07aadc36a9b0f18cca20ba9b46a3d577')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib/${pkgname}

	make
}


package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

