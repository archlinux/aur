# Maintainer: leuko <aydos.de>

pkgname=xilinx-u280-gen3x16-xdma-validate
_pkgver=1-3585755
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Deployment platform testing firmware for AMD Alveo U280"
arch=('any')
license=('custom')
url="https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards"
source=(
    https://packages.xilinx.com/artifactory/debian-packages-cache/pool/${pkgname}_${_pkgver}_all.deb
)
b2sums=('05a9ac0fbd4ec836ea00c8e4edb9d93245bac7595c2dee653d7a2b2020cd72a88c8db6280d2a1b9b04449446df6800a48c62a6253ba2d1062603ab04a8023711')
package() {
  echo "Converting Debian package..."
  tar Jxpf data.tar.xz -C "$pkgdir"
  local p="$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/test/license
  install -Dm644 "$p"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$p"/LICENSE
  rmdir "$p"
}
