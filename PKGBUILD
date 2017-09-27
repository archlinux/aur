
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=theshell-blueprint
pkgver=7.1b
pkgrel=1
pkgdesc="Desktop Shell that gets out of your way"
arch=("x86_64")
url="https://github.com/vicr123/theshell"
license=('GPL3')
depends=('kwidgetsaddons' 'xdg-utils' 'wmctrl' 'kwin' 
'networkmanager' 'xorg-xbacklight' 'redshift' 'tsscreenlock' 
'libcups' 'qt5-base' 'ts-qtplatform' 'ts-startsession' 'qt5-charts'
'qt5-location' 'kscreen' 'kdepimlibs4' 'akonadi' 'ts-polkitagent' 'ts-bt' 'ts-bugreport')
optdepends=('alsa-utils: for volume controls'
	    'pocketsphinx: for theWave'
	    'festival: for theWave')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/theshell#branch=blueprint')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake "CONFIG+=blueprint" theShell.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
