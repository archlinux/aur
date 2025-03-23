# Maintainer: Andrew Demarest <contact@yonderserver.com>
pkgname=tablet-switch-git
pkgver=0.9
pkgrel=1
pkgdesc='A system tray application to manually switch between 2-in-1 laptop modes.'
arch=('x86_64')
url='https://github.com/ademarest/tablet-switch'
license=('GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007')
depends=(
	'qt6-base'
	'qt6-tools'
	'libevdev'	
)
source=('git+https://github.com/ademarest/tablet-switch.git')
sha256sums=('SKIP')

build(){
	cd tablet-switch;
	rm -rf build && mkdir -p build && cd build;
	DESTDIR="$pkgdir" PREFIX="/usr" qmake6 ../src/tablet-switch.pro;
	make;
}

package(){
	cd "${srcdir}/tablet-switch/build"
	make install
}
