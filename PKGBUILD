# Submitter: Stykers <stykers at stykers dot moe>
# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

pkgname=vagrant-vmware-utility
pkgver=1.0.20
pkgrel=1
pkgdesc="Plugin for vagrant vmware provider."
arch=('x86_64')
url="https://www.vagrantup.com/vmware/"
license=('MPL')
depends=('vagrant')
source=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_x86_64.rpm")
install=${pkgname}.install
sha256sums=('2d2dd88991f086ea34731e42fd14610af5cfd93536ae98bd60d65918bd0e22eb')

prepare() {
  mkdir -p ${srcdir}/${pkgname}
  bsdtar -xf "${pkgname}_${pkgver}_x86_64.rpm" -C ${srcdir}/${pkgname}
}

package() {
  cd ${srcdir}/${pkgname}

  mv etc ${pkgdir}
  mv opt ${pkgdir}
}
