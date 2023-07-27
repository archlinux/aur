# Menu_MiSTer for menu.rbf
# Maintainer: Alexandru M Stan <alex@hypertriangle.com>

buildarch=4

pkgname=mister-menu
pkgver=20230223
pkgrel=1
pkgdesc="FPGA bitstream loaded by uboot which shows the MiSTer menu"
arch=('armv7h')
url='https://github.com/MiSTer-devel/Menu_MiSTer'
license=('GPL2')
source=("git+https://github.com/MiSTer-devel/Menu_MiSTer.git")
sha256sums=('SKIP')

pkgver() {
  cd "Menu_MiSTer/releases"
  last_file=$(ls | tail -n 1)
  echo ${last_file} | sed "s/menu_//" | sed "s/.rbf//"
}

package() {
  install Menu_MiSTer/releases/menu_${pkgver}.rbf -D "${pkgdir}"/boot/menu.rbf
}
