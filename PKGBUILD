# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20250903
pkgrel=1
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'resolvconf: if you are controling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a69f3911b18cd5abb73ba1f695802c87205ed6be10be035a5d06ca266c5de3c0b88c0aeac7670bc302112288f1b58937608e7b2835a22d2b4fc45a8f63b218ad')

build(){
	cd ${pkgname}-${pkgver}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}/src
	make DESTDIR="$pkgdir/" install
}
