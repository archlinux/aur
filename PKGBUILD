# Maintainer: Dimitrios Vogiatzis <me@dimtree.net>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

pkgname=j4-dmenu-desktop
pkgver=2.16
pkgrel=1
pkgdesc="A much faster replacement for i3-dmenu-desktop. Its purpose is to find .desktop files and offer you a menu to start an application using dmenu."
arch=('any')
url="https://github.com/enkore/j4-dmenu-desktop"
license=('GPL3')
depends=('dmenu')
makedepends=('git' 'cmake')
conflicts=('j4-dmenu-desktop-git')
source=("${pkgname}-r${pkgver}.tar.gz::https://github.com/enkore/j4-dmenu-desktop/archive/r${pkgver}.tar.gz")
sha256sums=('cce03564227677ffbf0d1a15588247904c4fce997bc21bb92e1147a916b6c520')

build() {
	cd ${pkgname}-r${pkgver}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd ${pkgname}-r${pkgver}
	make DESTDIR="$pkgdir/" install
}
