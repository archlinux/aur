# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=frameworks
pkgver=0.3.7
pkgrel=2
pkgdesc="Stop-motion animation frame capture software primarily for Linux."
arch=('i686' 'x86_64')
url="http://frameworks.polycrystal.org/"
depends=('gtk' 'glib2' 'libglade' 'xf86-video-v4l')
license=('GPL2')
source=(http://frameworks.polycrystal.org/release/$pkgname-$pkgver.tar.gz)
md5sums=('019c3d9172158e69c718759f23b51ee6')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}
package() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	make DESTDIR=$startdir/pkg install
}
