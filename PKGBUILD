# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>

_appname=quickterminal
pkgname=$_appname-git
pkgver=0.0.1
pkgrel=1
pkgdesc='Lightweight Qt-based terminal emulator'
arch=('i686' 'x86_64')
url='https://github.com/trollixx/quickterminal'
license=('GPL2')
depends=('qtermwidget-qt5-git')
makedepends=('git')
provides=($_appname)
conflicts=($_appname)
source=('git://github.com/trollixx/quickterminal.git')
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_appname}
	git describe --always | sed 's|-|.|g' | sed 's|v||g'
}

build() {
	cd ${srcdir}/${_appname}
	qmake PREFIX=/usr
	make
}

package() {
	cd "${_appname}"
	make INSTALL_ROOT="$pkgdir" install
}
