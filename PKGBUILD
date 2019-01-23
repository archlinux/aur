
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell
pkgver=8.0.1
pkgrel=0
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 
'networkmanager' 'xorg-xbacklight' 'redshift' 'tsscreenlock'
'libcups' 'qt5-base' 'ts-qtplatform' 'qt5-charts'
'qt5-location' 'kscreen' 'ts-bt' 'ts-bugreport')
optdepends=('alsa-utils: for volume controls')
makedepends=('git')
conflicts=('ts-startsession' 'ts-polkitagent')
replaces=('ts-startsession' 'ts-polkitagent')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theshell#branch=master')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake theShell.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
