# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=brisk-menu
pkgver=0.3.0
pkgrel=1
pkgdesc='Modern, efficient menu for the MATE Desktop Environment.'
arch=('i686' 'x86_64')
url='https://github.com/solus-project/brisk-menu'
license=('GPL2')
groups=('mate')
depends=('mate-panel-gtk3')
source=("https://github.com/solus-project/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('76104267448188a1074d714e6f32b187')


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

