# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=qgnomeplatform
pkgver=0.3
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings 
as possible"
arch=('x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('qt5-base' 'gtk3')
makedepends=('git')
source=("git+https://github.com/MartinBriza/QGnomePlatform.git#tag=$pkgver")
md5sums=('SKIP')

build() {
	cd QGnomePlatform
	qmake-qt5
	make
}

check() {
	cd QGnomePlatform
	make -k check
}

package() {
	cd QGnomePlatform
	make INSTALL_ROOT="$pkgdir/" install
}

