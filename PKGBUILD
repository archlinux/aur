# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG kernel module (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260828
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-linux" "amneziawg-linux-hardened")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('726cb8aee21181382b214bbea856e9f99a464605a99461b23ccc342aa6da1699')

package() {
  depends+=("dkms")
  cd "amneziawg-linux-kernel-module-${pkgver}/src"
  make DESTDIR="${pkgdir}" dkms-install
}
