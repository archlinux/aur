# Maintainer: leuko <aydos.de>

pkgname=xilinx-cmc-u280
_pkgver=1.3.5-3592445
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Card management controller firmware for AMD Alveo U280"
arch=('any')
license=('custom')
url="https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards"
source=(
    https://packages.xilinx.com/artifactory/debian-packages-cache/pool/${pkgname}_${_pkgver}_all.deb
)
b2sums=('59a480408f7003f84ba9777e8872cbb874615980045582444e44c278a71c9df102c937389a13192f46daa1cc103f34f7850469e559e3f7666da853cc4bce0c5c')
package() {
  echo "Converting Debian package..."
  tar Jxpf data.tar.xz -C "$pkgdir"
  local p="$pkgdir"/opt/xilinx/firmware/cmc/u280/license
  install -Dm644 "$p"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$p"/LICENSE
  rmdir "$p"
}
