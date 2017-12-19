
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell-blueprint
pkgver=7.2b
pkgrel=0
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 
'networkmanager' 'xorg-xbacklight' 'redshift' 
'libcups' 'qt5-base' 'ts-qtplatform' 'qt5-charts'
'qt5-location' 'kscreen' 'ts-polkitagent' 'ts-bt' 'ts-bugreport')
optdepends=('alsa-utils: for volume controls')
makedepends=('git')
conflicts=('ts-startsession')
replaces=('ts-startsession')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theshell#branch=blueprint')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname-$pkgver"
	echo $(cat version)b
}

build() {
	cd "$pkgname-$pkgver"
	qmake "CONFIG+=blueprint" theShell.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
