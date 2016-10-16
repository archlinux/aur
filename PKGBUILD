# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbwm
pkgver=1.49
pkgrel=1
pkgdesc="minimalist X11 window manager, based on evilwm"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/jbwm"
license=('MIT')
depends=('libxau' 'libx11' 'libxext')
source=( "https://github.com/jefbed/jbwm/archive/$pkgver.tar.gz" )

build() {
	cd "$pkgname-$pkgver"
	make LDFLAGS='-lX11 -lXext'
}

package() {
	cd "$pkgname-$pkgver"
	install -d $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}

md5sums=('6f078acab17109b1cfce8b7be1235081')
