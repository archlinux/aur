# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbwm
pkgver=1.57
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

md5sums=('87f8b3ac8a08c90a4630ed0d9b07d8e4')
