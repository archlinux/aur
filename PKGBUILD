# Maintainer: LighDot <lightdot -a-t- g m a i l>

pkgname=teg
pkgver=0.11.2
pkgrel=2
pkgdesc="Tenes Empanadas Graciela (TEG) is a clone of a 'Plan Tactico y Estrategico de la Guerra' board game, a pseudo-clone of Risk, a multiplayer turn-based strategy game."
arch=('x86_64')
url="https://github.com/wfx/teg"
license=('GPL2')
depends=('libgnomeui>=2.18.1-2')
makedepends=('intltool')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wfx/teg/archive/0.11.2.tar.gz")
md5sums=('55d08c1aebe4d04759c376a16dda7771')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-readline
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
