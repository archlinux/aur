# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20240711
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0499fc3c29ceaa3e57611fd86c943e57b9621aa2db31f8fdafcfe0ff0dfaf5aa07381d462d9b194c8ea206f5eb9d1160976bfc6d0fdaf112b81b87ad3d391538')

package() {
    depends=("dkms")
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    make DESTDIR=${pkgdir} dkms-install
}
