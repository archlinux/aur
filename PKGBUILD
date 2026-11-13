# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG kernel module (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20261113
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-linux" "amneziawg-linux-hardened")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8e96e1c19d31eae4d1897cd3655679c167c79ed1bbdd21e5d3efa1391bfc0607')

package() {
  depends+=("dkms")
  cd "amneziawg-linux-kernel-module-${pkgver}/src"
  make DESTDIR="${pkgdir}" dkms-install
}
