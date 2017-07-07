# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbwm
pkgver=1.56
pkgrel=1
pkgdesc="minimalist X11 window manager, based on evilwm"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/jbwm"
license=('MIT')
depends=('libxext' 'libxft')
source=( "https://github.com/jefbed/jbwm/archive/$pkgver.tar.gz" )

build() {
	cd "$pkgname-$pkgver"
	./configure
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/bin"
	make DESTDIR="${pkgdir}" install
}

md5sums=('aa61b1ac3fede0691a09aa68b1c95a56')
