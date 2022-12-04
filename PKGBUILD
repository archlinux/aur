# Maintainer: Connor Behan <connor.behan@gmail.com>
pkgname=libbdplus
pkgver=0.2.0
pkgrel=2
pkgdesc="Library for handling the BD+ protection scheme on bluray discs"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://www.videolan.org/developers/libbdplus.html"
depends=('libaacs>=0.7.0')
source=("ftp://ftp.videolan.org/pub/videolan/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
        # https://www.mail-archive.com/bug-autoconf@gnu.org/msg04648.html
	./configure --prefix=/usr --with-gpg-error-prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
sha256sums=('b93eea3eaef33d6e9155d2c34b068c505493aa5a4936e63274f4342ab0f40a58')
