# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: trile7 at gmail dot com
# Contributor: Ernia <monghitri@aruba.it>

pkgname=yad-gtk2
pkgver=0.35.0
pkgrel=2
pkgdesc='A fork of zenity - display graphical dialogs from shell scripts or command line - for gtk2'
url='http://sourceforge.net/projects/yad-dialog'
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gtk2')
provides=('yad')
conflicts=('yad')
makedepends=('intltool')
install='yad.install'
source=($url/files/${pkgname%-gtk2}-${pkgver}.tar.xz)
sha256sums=('cd98bdbd888e6e3b7d91bd6ddd2f6c3a61c4b0a64b2f96081c63893468e43ba0')

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

