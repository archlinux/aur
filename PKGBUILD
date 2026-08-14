# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG userspace tools (AWG 3.1: HeaderProtectionKey, padding, timing ranges)"
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=3.1.20260812
pkgrel=1
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'amneziawg-dkms: kernel module with AWG 3.1 support'
            'resolvconf: if you are controlling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dbd8ce0748d835d18f30bb76720246b7bfc80bd09cd17c379b1c59f683a18493')

build() {
  cd "${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}/" install
}
