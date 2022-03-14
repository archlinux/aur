# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>
# Contributer: Scimmia <scimmia22 at outlook dot com>
# Contributor: Orivej Desh <smpuj@bk.ru>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=reiser4progs
pkgver=1.2.2
pkgrel=1
pkgdesc="Reiser4 filesystem programs"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/reiser4/"
license=('GPL2')
depends=('e2fsprogs' 'libaal')
options=('!libtool')
source=("http://sourceforge.net/projects/reiser4/files/reiser4-utils/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1ddf462f88c50e869c5b2a08d9769c9929b8ec5eef47bb7427f8988a07a5bdbe')

build() {
	cd "${pkgname}-${pkgver}"

	CFLAGS+=" -Wno-error=format-security"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="$pkgdir" install
}
