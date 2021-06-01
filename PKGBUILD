# Maintainer: Oliver Giles <web ohwg net>
pkgname=networkmanager-f5vpn
pkgver=0.3
pkgrel=1
pkgdesc="NetworkManager VPN plugin for F5 SSL VPN"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ohwgiles/NetworkManager-f5vpn"
license=('GPL')
depends=('networkmanager' 'nm-connection-editor' 'libxml2' 'ppp')
makedepends=('cmake')
source=("https://github.com/ohwgiles/networkmanager-f5vpn/archive/$pkgver.tar.gz")
md5sums=('5c6fb389ebb42a66c255d7e9a59d976a')

prepare() {
	cd "$srcdir/NetworkManager-f5vpn-$pkgver"
}

build() {
	cd "$srcdir/NetworkManager-f5vpn-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/NetworkManager-f5vpn-$pkgver"
	make DESTDIR="$pkgdir/" install
}

