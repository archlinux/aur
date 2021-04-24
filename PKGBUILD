pkgname=libonvif
pkgver=1.1.0
pkgrel=1
pkgdesc="A client side implementation of the ONVIF specification."
url="https://github.com/sr99622/libonvif"
arch=('i686' 'x86_64')
license=('GPL-2')
makedepends=('intltool' 'autoconf')
depends=('libxml2')
source=("https://github.com/sr99622/${pkgname}/archive/refs/tags/v${pkgver}.zip")
md5sums=('4a7a03d252565cdefba93a21ff52936c')

build() {
	cd $srcdir/${pkgname}-$pkgver
	autoreconf
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/${pkgname}-$pkgver
	make DESTDIR="$pkgdir" install
}
