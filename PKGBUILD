# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard. "
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=0.2.17
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: Tools for configuration amneziawg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('1850a13ec1085252b3b7f020f266cc7eb937441d93e8b56197fefb9e177d0c0b857a661cc23f7ce58b1da0b680d553d9cbc5d2680a3ea7ceac2996f840ec4b96')

build(){
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


