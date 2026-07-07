# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20260618
pkgrel=2
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'resolvconf: if you are controling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz")
sha512sums=('5f75260e9de307b1e20f403b5acaf044e0930557adfc1556d9fa04f96e776d73be261658d9aee21aec518c09fa98d4405ef663c8eb908ea76c84d184bf77ec53')

build(){
	cd ${pkgname}-${pkgver}-${pkgrel}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}-${pkgrel}/src
	make DESTDIR="$pkgdir/" install
}
