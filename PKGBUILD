# Maintainer    : GI Jack <iamjacksemail@hackermail.com>
# Contributer   : Philipp Geyer <nistur@gmail.com>
# Modified      : Gustavo Alvarez <sl1pkn07 [at] gmail [dot] com>

pkgname=crark-opencl
pkgver=5.1
download="crark51-linux.rar"
pkgrel=2
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors."
arch=('x86_64')
url="http://www.crark.net/"
license=("freeware-proprietary")
depends=('unrar')
depends=('libcl')
makedepends=('unrar')
provides=('crark')
conflics=('crark')
replaces=('crark')
source=("http://www.crark.net/download/${download}")
sha256sums=('e1c888f27b3858628985739e522f8d11f79be9bdeb60ba88edae0d4360235947')
install=${pkgname}.install

prepare() {
  mkdir -p ${pkgname}-${pkgver}
  unrar x -xcrackme ${download} ${pkgname}-${pkgver}
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  chmod +r ${pkgdir}/opt/${pkgname}/{spanish,english}.def
}

