# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=j4-dmenu-desktop
pkgver=2.14
pkgrel=1
pkgdesc="A much faster replacement for i3-dmenu-desktop. It's purpose is to find .desktop files and offer you a menu to start an application using dmenu."
arch=('i686' 'x86_64')
url="https://github.com/enkore/j4-dmenu-desktop"
license=('GPL3')
depends=('dmenu')
makedepends=('git' 'cmake')
conflicts=('j4-dmenu-desktop-git')
source=("https://github.com/enkore/j4-dmenu-desktop/archive/r${pkgver}.zip")
md5sums=('c94966de2552faf6e023c3a2d5c59f17')

prepare() {
    :
}

build() {
	cd ${pkgname}-r${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${pkgname}-r${pkgver}
	make DESTDIR="$pkgdir/" install
}
