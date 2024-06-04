# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard. "
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=0.2.11
pkgrel=1
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3811479ed90eb4a582c513522ffbdb672ff605bed7e449bd3fb552e21bfcdf136265495532258a6235d66990dc03ef6924bc29a017be42f80678c4192e0aaf86')
options=(!lto)
provides=("wireguard-go")
conflicts=("wireguard-go")

build(){
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


