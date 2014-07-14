# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>
# Contributer: Scimmia <scimmia22 at outlook dot com>
# Contributor: Orivej Desh <smpuj@bk.ru>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=reiser4progs
pkgver=1.0.9
pkgrel=1
pkgdesc="Reiser4 filesystem programs"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/reiser4/"
license=('GPL2')
depends=('e2fsprogs' 'libaal')
options=('!libtool')
source=("http://sourceforge.net/projects/reiser4/files/reiser4-utils/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('1fe5dce409277d8209ea28f32c6b199f')

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="$pkgdir" install
}
