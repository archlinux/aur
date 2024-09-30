# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20240213
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bc7c871b545a405ecf108a6ac20c5719576b1d903f967b022a00e1a01c6b5b51a01c1ddebbf8c24c35a0dd9911c8913a8b4639797a1ed2ae15e0635c8efe180e')

package() {
    depends=("dkms")
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    make DESTDIR=${pkgdir} dkms-install
}
