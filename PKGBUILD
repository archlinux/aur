# Maintainer: ServiusHack <serviushack at gmx dot de>
pkgname=libqatemcontrol-git
pkgver=v0.3.r54.g252b031
pkgrel=1
pkgdesc='Implements the protocol used to connect to BlackMagic ATEM switches'
arch=('x86_64')
url='https://github.com/petersimonsson/libqatemcontrol'
license=('LGPL')
depends=('qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/petersimonsson/libqatemcontrol.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}
