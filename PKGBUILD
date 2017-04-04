# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=j4-dmenu-desktop
pkgver=2.15
pkgrel=1
pkgdesc="A much faster replacement for i3-dmenu-desktop. Its purpose is to find .desktop files and offer you a menu to start an application using dmenu."
arch=('i686' 'x86_64')
url="https://github.com/enkore/j4-dmenu-desktop"
license=('GPL3')
depends=('dmenu')
makedepends=('git' 'cmake')
conflicts=('j4-dmenu-desktop-git')
source=("https://github.com/enkore/j4-dmenu-desktop/archive/r${pkgver}.zip")
sha256sums=('b42188d7bf02954b2d90fc47d90ebe8e516e9e3aa1d80aa08aab00a7b35e2f3a')

build() {
	cd ${pkgname}-r${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${pkgname}-r${pkgver}
	make DESTDIR="$pkgdir/" install
}
