# Maintainer: kylon

_base=goodix
_pkgbase=${_base}-gpdwin3
pkgname=${_pkgbase}-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Goodix touchscreen driver hack for GPD WIN3"
arch=('any')
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=(
  "goodix.c"
  "dkms.conf"
  "Makefile"
)
md5sums=('dfb7e11d9209b8512a10236d5ff39a2b'
         'e5c031710ce7c30e237655d52de0175b'
         'd33b0aa9a29b5f5b811e4869ee40e245')

package() {
  cd "$srcdir"
  local install_dir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"
  install -Dm644 goodix.c "${install_dir}/goodix.c"
  install -Dm644 Makefile "${install_dir}/Makefile"
}

