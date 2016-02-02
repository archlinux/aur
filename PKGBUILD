# Maintainer: spider-mario <spidermario@free.fr>
pkgname=qgnomeplatform-git
pkgver=0.0.5
pkgrel=1
pkgdesc="Qt Platform Theme aimed to accomodate as much of GNOME settings as possible"
arch=('i686' 'x86_64')
url="https://github.com/MartinBriza/QGnomePlatform"
license=('LGPL2.1')
depends=('qt5-base')
makedepends=('git')
provides=('qgnomeplatform')
conflicts=('qgnomeplatform')
source=('git+https://github.com/MartinBriza/QGnomePlatform.git')
md5sums=('SKIP')

pkgver() {
	cd QGnomePlatform
	echo -n "0.0."
	git rev-list --count master
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
