# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20250706
pkgrel=1
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'resolvconf: if you are controling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('556ae1547e69c98188cd16870c53219bc56e6e9dcd8cf8a95e9dd4e3cfa3d3894aaad5d33e5c30fea8da041b25aa465036409840fbce34fde8922bcc05d18561')

build(){
	cd ${pkgname}-${pkgver}/src
	make
}

package() {
	cd ${pkgname}-${pkgver}/src
	make DESTDIR="$pkgdir/" install
}
