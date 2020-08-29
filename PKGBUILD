# Maintainer: Oliver Giles <web ohwg net>
pkgname=networkmanager-f5vpn
pkgver=0.1
pkgrel=1
pkgdesc="NetworkManager VPN plugin for F5 SSL VPN"
arch=('i686' 'x86_64')
url="https://github.com/ohwgiles/NetworkManager-f5vpn"
license=('GPL')
depends=('networkmanager' 'nm-connection-editor' 'libxml2')
makedepends=('cmake')
source=("https://github.com/ohwgiles/networkmanager-f5vpn/archive/$pkgver.tar.gz")
md5sums=('015065d48138322c5e20f16574e79131')

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

