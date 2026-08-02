# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard. "
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=3.0.3
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: Tools for configuration amneziawg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('07f9ec29e0b424360ce939398808c0f9c00f9b0a2485e27d3f2bc91d6a2722e3a456bdf986a42fd2f83c9a3aaff5bad8580c5f8dd00128d1b6ee49af8e8f6da1')

build(){
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


