# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.1.2
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/solus-project/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel-gtk3')
makedepends=('gnome-common')
source=("https://github.com/solus-project/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('cb148fcabcbc3c111c5b7f26ef3fa613')


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

