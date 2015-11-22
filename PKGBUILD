# Maintainer     : GI Jack <iamjacksemail@hackermail.com>
# Contributer  : Philipp Geyer <nistur@gmail.com>
# Modified     : Gustavo Alvarez <sl1pkn07 [at] gmail [dot] com>

pkgname=crark-opencl
pkgver=5.1
download="crark51-linux-opencl.rar"
pkgrel=1
pkgdesc="A command-line utility for RAR 2.x-3.x password cracking, uses Password Cracking Library 2.0 that supports special password recovery language. Highly optimized for all modern processors."
arch=('x86_64')
url="http://www.crark.net/"
license="unknown"
depends=('unrar')
makedepends=('unrar')
provides=('crark')
conflics=('crark')
replaces=('crark')
source=("http://www.crark.net/download/${download}")
sha256sums=('b69ab7feabc6aa4c88abc869834dd8a45ca9a16d42e332bbc39aad12bab5aae1')
install=install
build() {
  mkdir -p ${pkgname}-${pkgver}
  unrar x -xcrackme ${download} ${pkgname}-${pkgver}
  cd ${srcdir}/${pkgname}-${pkgver}
}
package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}
  chmod +r ${pkgdir}/opt/${pkgname}/{spanish,english,russian}.def
}

