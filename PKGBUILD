# Maintainer: leuko <aydos.de>

pkgname=xilinx-sc-fw-u280
_pkgver=4.3.28-1.ea1b92f
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Satellite controller firmware for AMD Alveo U280"
arch=('any')
license=('BSD' 'custom')
url="https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards"
source=(
    https://packages.xilinx.com/artifactory/debian-packages-cache/pool/xilinx-sc-fw-u280_4.3.28-1.ea1b92f_all.deb
)
b2sums=('43a8d35a771997b2d462f022a476cad392fa8b28412fddae65f840d2992170e14155746dddef0670730474d23b03bc39877efee9e45072485205804bbb477d14')
package() {
  echo "Converting Debian package..."
  tar Jxpf data.tar.xz -C "$pkgdir"
  local p="$pkgdir"/opt/xilinx/firmware/sc-fw/u280/license
  install -Dm644 "$p"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$p"/LICENSE_BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE_BSD"
  rm "$p"/LICENSE*
  rmdir "$p"
}
