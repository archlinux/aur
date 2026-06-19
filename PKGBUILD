# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard. "
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=0.2.19
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: Tools for configuration amneziawg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3aa6773bade9ef8b94854b924e65bee0913571ea6da66018565ef880f6e16205144e693098646fb462c5b0690363c023f91ca2cf6e901ac96e86f62528b2980c')

build(){
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


