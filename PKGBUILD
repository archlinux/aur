# Maintainer: Oliver Giles <web ohwg net>
pkgname=networkmanager-f5vpn
pkgver=0.5
pkgrel=1
pkgdesc="NetworkManager VPN plugin for F5 SSL VPN"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ohwgiles/NetworkManager-f5vpn"
license=('GPL')
depends=('networkmanager' 'nm-connection-editor' 'libxml2' 'ppp')
makedepends=('cmake')
source=("https://github.com/ohwgiles/networkmanager-f5vpn/archive/$pkgver.tar.gz")
md5sums=('aded25f40fd19f0075509df1cd5e5f46')

prepare() {
	cd "$srcdir/NetworkManager-f5vpn-$pkgver"
}

build() {
	cd "$srcdir/NetworkManager-f5vpn-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib .
	make
}

package() {
	cd "$srcdir/NetworkManager-f5vpn-$pkgver"
	make DESTDIR="$pkgdir/" install
}

