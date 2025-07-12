# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard. "
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=0.2.13
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: Tools for configuration amneziawg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('69f10f712016913124e114b4c5b2e7ecca8b8c53a3d05187c1660568cf941520860af25b188e65e6a3b65d92b1fbabedc24e5a09f50edcff59224434f8916a86')

build(){
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


