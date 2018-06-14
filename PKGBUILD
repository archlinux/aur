# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad-gtk2
pkgver=0.40.0
pkgrel=1
pkgdesc='A fork of zenity - display graphical dialogs from shell scripts or command line - for gtk2'
url='http://sourceforge.net/projects/yad-dialog'
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk2')
provides=('yad')
conflicts=('yad')
makedepends=('intltool')
source=($url/files/${pkgname%-gtk2}-${pkgver}.tar.xz)
sha256sums=('c2d0b7d1b6d3a0877299faa00db75d58c974f81fce72d520a3a84e67d1d60ef4')

build() {
	cd "${srcdir}/${pkgname%-gtk2}-${pkgver}"

	./configure \
		--prefix=/usr \
		--with-gtk=gtk2 \
		--disable-icon-browser \
		--disable-html

	make
}

package() {
	cd "${srcdir}/${pkgname%-gtk2}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

