# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-go
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard. "
url="https://github.com/amnezia-vpn/amneziawg-go"
arch=("x86_64")
pkgver=0.2.15
pkgrel=1
license=('MIT')
makedepends=('go')
optdepends=('amneziawg-tools: Tools for configuration amneziawg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-go/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b033cad5764d8661960062100e2ed6e151131085a9e61c364fff7c4711761dd161d4c23c8424c14e7f41b99955d1d247116fcdf7ee80d766d8e23afcf9f9d61f')

build(){
	cd ${pkgname}-${pkgver}/
	make
}

package() {
	cd ${pkgname}-${pkgver}/
	make DESTDIR="$pkgdir/" install
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


