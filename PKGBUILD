# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20240213
pkgrel=1
license=('GPL-2.0')
depends=('bash' 'amneziawg-go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('088448e641256364edb0369b3f23fbfb165a692e4a56e4a8a90cd1812977d70d7bb47f4d5928d167eea035bb5ea1a19372d01919bf8c997167687b7bb3e3d6f5')
options=(!lto)
provides=("wireguard-tools")
conflicts=("wireguard-tools")

build(){
	cd ${pkgname}-${pkgver}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}/src
	make DESTDIR="$pkgdir/" install
}


