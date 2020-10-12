pkgname=bumprace
pkgver=1.5.8
pkgrel=1
pkgdesc="Arcade Game. You've got to get from the start to the finish line without crashing into deadly blocks."
arch=('x86_64' 'i686')
url="http://www.linux-games.com/bumprace"
license=('GPL2')
depends=('sdl' 'libjpeg-turbo' 'sdl_mixer' 'sdl_image')
source=("https://github.com/karlb/bumprace/archive/$pkgver.tar.gz")
sha512sums=('bffc1d829deb048644fa21eb4566e2008573c0ee2e6f96e75470c8a6fa4cacb788cb93adf6e24b53f32884fd999880ffc527a903ce617a376cb5aae4c1b97480')

build() {
	cd karlb-$pkgname-034aca498e89
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
	make
}

package() {
	cd karlb-$pkgname-034aca498e89
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --sbindir=/usr/bin
	make DESTDIR="$pkgdir/" install
}
