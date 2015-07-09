# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=frameworks
pkgver=0.3.7
pkgrel=3
pkgdesc="Stop-motion animation frame capture software primarily for Linux."
arch=('i686' 'x86_64')
url="http://frameworks.polycrystal.org/"
depends=('gtk' 'glib2' 'libglade')
license=('GPL2')
source=(http://frameworks.polycrystal.org/release/$pkgname-$pkgver.tar.gz)
md5sums=('019c3d9172158e69c718759f23b51ee6')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	make LDFLAGS=-lm
}
package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
}
