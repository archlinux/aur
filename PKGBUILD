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
sha256sums=('1f6f314e573cad848e71b32341035a8902aa13030510356b6dbabab261b9d187')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install 
}
