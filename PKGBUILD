# Maintainer: kylon

_pkgbase=goodix-gpdwin3
pkgname=${_pkgbase}-dkms
pkgver=1.1
pkgrel=1
pkgdesc="Goodix touchscreen driver hack for GPD WIN3"
arch=('any')
license=('GPL2')
depends=('dkms')
install=${pkgname}.install
source=(
  "goodix.c"
  "goodix.h"
  "goodix_fwupload.c"
  "dkms.conf"
  "Makefile"
  "goodixgpdw3.conf"
)
md5sums=('6ef1b9c306d7996e7bfdb9cc50677f81'
	 '7543431323fd4a1efb2d381b69886ef9'
	 '616b595d278b52a265156c2fa68a740c'
         '5861e444eb6ba83d44a3c746f04e9a04'
         '7b0228ff533f0a8e63dc962621e0d97e'
         '1505740dffca34d8119f3798a0624ebc')

package() {
  cd "$srcdir"
  local install_dir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"
  install -Dm644 goodix.c "${install_dir}/goodix.c"
  install -Dm644 goodix.h "${install_dir}/goodix.h"
  install -Dm644 goodix_fwupload.c "${install_dir}/goodix_fwupload.c"
  install -Dm644 Makefile "${install_dir}/Makefile"
  install -Dm644 goodixgpdw3.conf "${pkgdir}/etc/modprobe.d/goodixgpdw3.conf"
}

