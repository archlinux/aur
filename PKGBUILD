# Maintainer: <peter at typeblog dot net>

_base=goodix
_pkgbase=${_base}-p2max
pkgname=${_pkgbase}-dkms
pkgver=20190917
pkgrel=1
pkgdesc="Goodix touchscreen driver hack for GPD P2 Max"
arch=('any')
license=('GPL2')
url="https://github.com/PeterCxy"
depends=('dkms')
install=${pkgname}.install
source=(
  "goodix.c"
  "dkms.conf"
  "Makefile"
)
md5sums=('8e926b1baf8f7f367cebce2c8e883357'
         '6aec7e75f05eef67ec7cf41f23fdef7d'
         'd33b0aa9a29b5f5b811e4869ee40e245')

package() {
  cd "$srcdir"
  local install_dir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"
  install -Dm644 goodix.c "${install_dir}/goodix.c"
  install -Dm644 Makefile "${install_dir}/Makefile"

}

