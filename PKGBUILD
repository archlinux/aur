# Maintainer: Alexander Daum <alexander.daum@mailbox.org>

pkgname=vivado-board-rfsoc4x2
pkgver=2024.2
pkgrel=1
pkgdesc="Board files for Realdigita RFSoC 4x2 Board for Vivado 2024.2"
url="https://www.realdigital.org/hardware/rfsoc-4x2"
arch=('x86_64')
license=('custom')

depends=('vivado=2024.2')

source=('rfsoc4x2.zip::https://www.realdigital.org/downloads/9d2af32116d5420d25da904f6a06bb1f.zip')

sha512sums=('2a9c9ec14f468e5d5ba3add908739bcd4cf76837211d39514cf8169429b6854575d0243e6116034585e06fd610c16eec62bc33e857aefeb3c809c59ada630353')

# Prefix where Vivado is installed
_installprefix=/opt/Xilinx

package() {
    install -dm755 "$pkgdir$_installprefix/Vivado/${pkgver}/data/xhub/boards/XilinxBoardStore/boards/Xilinx/rfsoc4x2"
    for boardfile in "$srcdir"/rfsoc4x2/1.0/*; do
        install -m644 -t "$pkgdir$_installprefix/Vivado/${pkgver}/data/xhub/boards/XilinxBoardStore/boards/Xilinx/rfsoc4x2/" "$boardfile"
    done
}
