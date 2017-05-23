# Maintainer: cylgom <cylgom@gmail.com>
pkgname=ly-git
pkgver=0.0.1
pkgrel=1
pkgdesc="ncurses display manager"
arch=('i686' 'x86_64')
url="https://github.com/cylgom/ly"
license=('custom:WTFPL')
makedepends=('git')
depends=('pam' 'ncurses' 'libx11' 'xorg-xinit' 'xorg-xauth')
source=('git+https://github.com/cylgom/ly.git')
md5sums=('SKIP')

build() {
	cd ly
	make
}

package() {
	cd ly
	make DESTDIR="$pkgdir" install
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
