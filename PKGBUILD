
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell
pkgver=8.0.2
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
conflicts=('ts-startsession' 'ts-polkitagent')
replaces=('ts-startsession' 'ts-polkitagent')
source=('https://github.com/vicr123/theshell/archive/refs/tags/v8.0.2.tar.gz')
sha256sums=('00bf5d9838eae954f505143a6530d13f67938d0d3a7c5333971e4cb1b50cc615')

build() {
	cd "$pkgname-$pkgver"
	qmake theShell.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make -i install INSTALL_ROOT=$pkgdir
	chmod u+s $pkgdir/usr/lib/ts-mousepass-change
}
