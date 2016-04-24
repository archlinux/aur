# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=jbwm
pkgver=1.44
pkgrel=1
pkgdesc="minimalist X11 window manager, based on evilwm"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/jbwm"
license=('MIT')
depends=('libxau' 'libx11' 'libxext')
source=( "https://github.com/jefbed/jbwm/archive/$pkgver.tar.gz" )

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}
md5sums=('25e842a53bc51348ec4caf48a5552a84')
