# Maintainer: Victor Tran <vicr12345 at gmail dot com>
# Maintainer: Solomon Choina <shlomochoina at gmail dot com>
#
pkgname=lightdm-thedesk-greeter
pkgver=0.1
pkgrel=1
pkgdesc="LightDM greeter for theDesk"
arch=("x86_64")
url="https://github.com/vicr123/liblightdm-qt5"
license=('GPL3')
depends=('the-libs' 'libtdesktopenvironment' 'liblightdm-qt5')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"git+https://github.com/vicr123/lightdm-thedesk-greeter.git")
#sha256sums=('7c85d6e089285ab3206fc9731110a155dd46e30067554edc71f3edb33872b181')
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake lightdm-thedesk-greeter.pro
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
