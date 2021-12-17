# Submitter: Stykers <stykers at stykers dot moe>
# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

pkgname=vagrant-vmware-utility
pkgver=1.0.21
pkgrel=1
pkgdesc="Plugin for vagrant vmware provider."
arch=('x86_64')
url="https://www.vagrantup.com/vmware/"
license=('MPL')
depends=('vagrant')
source=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_x86_64.rpm")
install=${pkgname}.install
b2sums=('d53fbdf746908c35f2fb9534c846138fe624fa8c5c03d8814a237badeb81393ab7b98986e03a322390498f298ac0e9d781134f4ed0087e4fef6c298e048df361')

prepare() {
  mkdir -p ${srcdir}/${pkgname}
  bsdtar -xf "${pkgname}_${pkgver}_x86_64.rpm" -C ${srcdir}/${pkgname}
}

package() {
  cd ${srcdir}/${pkgname}

  mv etc ${pkgdir}
  mv opt ${pkgdir}
}
