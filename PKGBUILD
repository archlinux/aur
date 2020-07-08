# Submitter: Stykers <stykers at stykers dot moe>
# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

pkgname=vagrant-vmware-utility
pkgver=1.0.9
pkgrel=1
pkgdesc="Proprietary plugin for vagrant vmware provider."
arch=('x86_64')
url="https://www.vagrantup.com/vmware/"
license=('unknown')
depends=('vagrant')
source=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_x86_64.rpm")
install=${pkgname}.install
sha256sums=('4062451885443dd207bf075a619bcbd71332c95b282d926d9729fdd7af01fec9')

prepare() {
  mkdir -p ${srcdir}/${pkgname}
  bsdtar -xf "${pkgname}_${pkgver}_x86_64.rpm" -C ${srcdir}/${pkgname}
}

package() {
  cd ${srcdir}/${pkgname}

  mv etc ${pkgdir}
  mv opt ${pkgdir}
}
