# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbwm
pkgver=1.50
pkgrel=2
pkgdesc="minimalist X11 window manager, based on evilwm"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/jbwm"
license=('MIT')
depends=('libxext')
source=( "https://github.com/jefbed/jbwm/archive/$pkgver.tar.gz" )

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/bin"
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('5d6d2b43088f867fc6f3cea9c158b339')
