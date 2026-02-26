# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20260223
pkgrel=1
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'resolvconf: if you are controling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('591afaef659e26be16c8d883da8d8ff026f855f60c9887440b566ef18b9948ca57754673d833f27e77d8c05f7e354f37b49adc9f5467334eeb7eda7165960c54')

build(){
	cd ${pkgname}-${pkgver}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}/src
	make DESTDIR="$pkgdir/" install
}
