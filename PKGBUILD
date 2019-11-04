# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qgnomeplatform-git
pkgver=0.3.r7.gd67dae6
pkgrel=2
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings as possible"
arch=('i686' 'x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('gtk3' 'qt5-wayland' 'qt5-x11extras')
makedepends=('git')
provides=('qgnomeplatform')
conflicts=('qgnomeplatform')
source=('git+https://github.com/MartinBriza/QGnomePlatform.git')
md5sums=('SKIP')

pkgver() {
	cd QGnomePlatform
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
