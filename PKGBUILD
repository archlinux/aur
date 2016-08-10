# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Command line tool to make bootable FAT file systems'
pkgname='makebootfat'
pkgver='1.4'
pkgrel='1'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/advancemame/advanceboot/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('638356c951670187960d0050d963116391d4b494bc9b082b3d4673188450e47f22fda5733aa09b15cfbb1640807676f5f8743dd094b9931f150b445eb8d335dd')

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
