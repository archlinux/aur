# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Kovivchak Evgen <oneonfire@gmail.com>
# Contributer: Scimmia <scimmia22 at outlook dot com>
# Contributor: Orivej Desh <smpuj@bk.ru>

pkgname=libaal
pkgver=1.0.6
pkgrel=1
pkgdesc="Reiser4 filesystem support library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/reiser4/"
depends=('glibc')
options=('!libtool' 'staticlibs')
license=('GPL2')
source=("http://sourceforge.net/projects/reiser4/files/reiser4-utils/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('6fd5c2471e1fd3972fb23ac5dc1b77e3')

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="$pkgdir" install
}
