# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG userspace tools (AWG 3.0: HeaderProtectionKey, padding, timing ranges)"
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=3.0.20260730
pkgrel=1
license=('GPL-2.0')
depends=('bash')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'amneziawg-dkms: kernel module with AWG 3.0 support'
            'resolvconf: if you are controlling DNS via AmneziaWG')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-tools/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('25d5904cdf8021af22d8e45fb46df558fa5b0cf1813fe2101cf3d5e8482f697d')

build() {
  cd "${pkgname}-${pkgver}/src"
  make
}

package() {
  cd "${pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}/" install
}
