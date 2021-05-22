# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmannt-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Filip Wojciechowski <filip at loka dot pl>

pkgname=tagtool
pkgver=0.14.2
pkgrel=1
pkgdesc='Tool to edit tags in MP3 and Ogg Vorbis files'
url='https://github.com/impegoraro/tagtool'
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
makedepends=('intltool')
depends=('gtk3' 'id3lib' 'libvorbis')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c2b2c2a9a20a0173e618534e0c787e02860ff0de728e0ceea27d445397fc51c3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install 
}
