# Maintainer: leuko <aydos.de>

pkgname=xilinx-u280-gen3x16-xdma-dev
_pkgver=202211-3585755
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Deployment platform firmware for AMD Alveo U280 dev package"
arch=('any')
license=('custom')
url="https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards"
source=(
    # Due to EULA download this file manually from https://www.xilinx.com/products/boards-and-kits/alveo/u280.html#gettingStarted
    file://xilinx-u280-gen3x16-xdma-1-202211-1-dev_1-3585755_all.deb
)
# from https://www.xilinx.com/products/boards-and-kits/alveo/u280.html#gettingStarted
sha512sums=('c9f8000063448eaa7491b74db6ce951a61d064353933bfc9f0449fe7f08dec5b0a8532d5330edf7db9a846cc4751fbd9406d406fde7fb7d3ee74c37244897074')
package() {
  echo "Converting Debian package..."
  tar xpf data.tar.xz -C "$pkgdir"
  local p="$pkgdir"/opt/xilinx/platforms/xilinx_u280_gen3x16_xdma_1_202211_1/license
  install -Dm644 "$p"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$p"/LICENSE
  rmdir "$p"
}
