# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Filip Wojciechowski <filip at loka dot pl>

pkgname=tagtool
pkgver=0.14
pkgrel=1
pkgdesc='Tool to edit tags in MP3 and Ogg Vorbis files'
url='https://github.com/impegoraro/tagtool'
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
makedepends=('intltool')
depends=('glade' 'id3lib' 'libvorbis')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('05eef662d0f0f46983ad9a1e942e6ce4ac66276d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install 
}
