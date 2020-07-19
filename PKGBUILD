# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qgnomeplatform-git
pkgver=0.6.1.r8.g53d7924
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings as possible"
arch=('i686' 'x86_64')
url="https://github.com/FedoraQt/QGnomePlatform"
license=('LGPL2.1')
depends=('gtk3' 'qt5-wayland')
makedepends=('git')
provides=('qgnomeplatform')
conflicts=('qgnomeplatform')
source=('git+https://github.com/FedoraQt/QGnomePlatform.git')
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
