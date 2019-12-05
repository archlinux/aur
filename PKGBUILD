
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell-blueprint
pkgver=8.1b
pkgrel=2
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 
'networkmanager' 'xorg-xbacklight' 'redshift' 
'libcups' 'qt5-base' 'ts-qtplatform' 'qt5-charts'
'qt5-location' 'kscreen' 'ts-bt' 'ts-bugreport' 'pulseaudio-qt' 'libtdesktopenvironment')
optdepends=('alsa-utils: for volume controls')
makedepends=('git' 'qt5-tools')
conflicts=('ts-startsession')
replaces=('ts-startsession')
source=("$pkgname-repo"::'git+https://github.com/vicr123/theshell#branch=blueprint')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname-repo"
	echo $(cat version)b
}

build() {
	cd "$pkgname-repo"
	qmake "CONFIG+=blueprint" theShell.pro
	make
}

package() {
	cd "$pkgname-repo"
	make install INSTALL_ROOT=$pkgdir
}
