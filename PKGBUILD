# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG kernel module (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260906
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-linux" "amneziawg-linux-hardened")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e32fa46f1b6f9e319c5261f0b0765c3a9261e40cb7c4616fd73500da961a2932')

package() {
  depends+=("dkms")
  cd "amneziawg-linux-kernel-module-${pkgver}/src"
  make DESTDIR="${pkgdir}" dkms-install
}
