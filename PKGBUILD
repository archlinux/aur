# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20260618
pkgrel=1
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'resolvconf: if you are controling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b4e74e2427cec827ea2349cf972ee24a2e7457df5a19b6b5129ed34f48a2481648d36fa915e00fc31a89930b1b9de18a032dd1431f8d51576e4a001a8cebe76d')

build(){
	cd ${pkgname}-${pkgver}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}/src
	make DESTDIR="$pkgdir/" install
}
